<?php
class importXML {
    const NS = 'ss';
    const LANGUAGE_ID = 5;
    const OPTION_TYPE = 'select';

    private $_domXML;
	private $_worksheets = array();
	private $_docNamespaces = array();

	private static $currentWorksheet = '';

	public function __construct($xml) {
		$this->_domXML = simplexml_load_file($xml);
        $worksheets = $this->_domXML->Worksheet;
        $this->_docNamespaces = $this->_domXML->getDocNamespaces();

        if(array_key_exists(self::NS, $this->_docNamespaces))
        {
            foreach($worksheets as $worksheet){
                $key = (string)$worksheet->attributes(self::NS, TRUE)->Name;
                $this->_worksheets[$key] = $worksheet;
            }
            
            unset($this->_domXML);
        }

	}

    public function getWorksheet($name, $save = true) {
        if($save) {
            self::$currentWorksheet = $name;
            return $this;
        }
        else{
            return $this->_worksheets[$name];
        }
    }

    public function data() {
        $ns = self::NS;
        $ws = $this->_worksheets[self::$currentWorksheet];
        $rows = $ws->xpath("$ns:Table/$ns:Row");

        $header = array_shift($rows);
        $indexes = array();
        $out = array();
        $items = array();

        foreach ($header->xpath("$ns:Cell/$ns:Data") as $index) {
            $indexes[] = strtolower(str_replace('-', '_', (string)$index));
        }

        $i = 0;

        foreach($rows as $row){
            if(!isset($row->xpath("$ns:Cell")[0]->Data)) continue;
            $cnt = 0;
            foreach ($row->xpath("$ns:Cell") as $value) {
                $out[$i][$indexes[$cnt]] = $value->xpath("$ns:Data") ? (string)$value->xpath("$ns:Data")[0] : "";
                $cnt++;
            }

            $items[] = $this->{'_' . strtolower(str_replace('-', '_', self::$currentWorksheet))}($out[$i]);

            $i++;
        }

        return  $items;
	}

    private function _product($data)
    {
        $required = array(
            'product_id' => self::LANGUAGE_ID,
            'language_id' => self::LANGUAGE_ID,
            'model' => '',
            'sku' => '',
            'upc' => '',
            'ean' => '',
            'jan' => '',
            'isbn' => '',
            'mpn' => '',
            'location' => '',
            'minimum' => 1,
            'quantity' => 1000,
            'subtract' => 0,
            'stock_status_id' => 6,
            'date_available' => "",
            'date_added' => "",
            'date_modified' => "",
            'manufacturer_id' => 1,
            'shipping' => 0,
            'price' => 0,
            'points' => 0,
            'weight' => 0,
            'weight_class_id' => 1,
            'length' => 0,
            'width' => 0,
            'height' => 0,
            'length_class_id' => 1,
            'status' => 1,
            'tax_class_id' => 1,
            'sort_order' => 0,
            'image' => '',
            'keyword' => '',
            //arrays
            'product_description' => array(),
            'product_option' => array(),
            'product_image' => array(),
            'product_category' => array(),
            'product_store' => array(0),
        );

        //product
        $product = array_merge($required, $data);
        $product['model'] = $product['model'] ? $product['model'] : $product['name'];
        $product['image'] = trim($product['image'], "/");

        //product_to_category
        if($product['category_id']){
            $product['product_category'][] = $product['category_id'];
        }

        //product_description
        if($product['name']){
            $product['product_description'][$product['language_id']] = array(
                'name' => $product['name'],
                'description' => $product['description'],
                'meta_keyword' => $product['meta_keyword'],
                'meta_description' => $product['meta_description'],
                'tag' => $product['tag'],
            );

            unset($product['description']);
            unset($product['description']);
            unset($product['meta_description']);
            unset($product['meta_keyword']);
            unset($product['name']);
            unset($product['tag']);
        }

        //product_option
        if(isset($product['options']) && $product['options']){

            $product_option_value = array();
            $options = array();

            foreach(explode(';', $product['options']) as $option){
                $src = explode('-', $option);
                if(!isset($src[1])) continue;
                $options[$src[0]] = $src[0];
                $product_option_value[$src[0]][] = array(
                    'option_value_id' => $src[1],
                    'quantity' => 1,
                    'subtract' => 0,
                    'price' => 0,
                    'price_prefix' => "+",
                    'points' => 0,
                    'points_prefix' => "+",
                    'weight' => 0,
                    'weight_prefix' => "+",
                );
            }

            foreach($options as $option){
            $product['product_option'][] = array(
                'type' => 'select',
                'required' => 1,
                'option_id' => $option,
                'product_option_value' => $product_option_value[$option]
            );
            }

            unset($product['options']);
        }

        //product_image
        if($product['images']){

            foreach(explode(';', $product['images']) as $image){
                $product['product_image'][] = array(
                    'image' => trim($image, "/"),
                    'sort_order' => 0,
                );
            }

            unset($product['images']);
        }

        unset($product['category_id']);
        unset($product['language_id']);
        unset($product['manufacturer']);
        unset($product['images']);
        return $product;

    }

    private function _category($data)
    {
        $required = array(
            'category_id' => 0,
            'parent_id' => 0,
            'top' => 0,
            'column' => 1,
            'date_added' => "",
            'date_modified' => "",
            'status' => 1,
            'sort_order' => 0,
            'image' => '',
            'keyword' => '',
            //arrays
            'category_description' => array(),
            'category_store' => array(0),
        );

        //category
        $category = array_merge($required, $data);

        //category_description
        if($category['name']){
            $category['category_description'][self::LANGUAGE_ID] = array(
                'name' => $category['name'],
                'description' => $category['description'],
                'meta_keyword' => $category['meta_keyword'],
                'meta_description' => $category['meta_description'],
            );

            unset($category['description']);
            unset($category['meta_description']);
            unset($category['meta_keyword']);
            unset($category['name']);
            unset($category['tag']);
        }

        $category['image'] = trim($category['image'], "/");

        return $category;

    }


    private function _option($data)
    {
        $required = array(
            'option_id' => 0,
            'type' => self::OPTION_TYPE,
            'sort_order' => 0,
            //arrays
            'option_description' => array(),
            'option_value' => array(),
        );

        //option
        $option = array_merge($required, $data);

        //option_description
        if($option['name']){
            $option['option_description'][self::LANGUAGE_ID] = array(
                'name' => $option['name'],
            );

            unset($option['name']);

        }

        //option_value
        $curr_ws = self::$currentWorksheet;
        self::$currentWorksheet = "Option-Value";
        $option_values = $this->data();
        self::$currentWorksheet = $curr_ws;

        foreach($option_values as $key => &$option_value){
            if($option_value['option_id'] != $option['option_id']) {
                unset($option_values[$key]);
            } else {
                $option_value['option_value_description'][self::LANGUAGE_ID] = array(
                    'name' => $option_value['name'],
                );
                unset($option_values[$key]['name']);
            }
        }

        $option['option_value'] = $option_values;

        return $option;

    }

    private function _option_value($data)
    {
        $required = array(
            'option_value_id' => 0,
            'image' => '',
            'sort_order' => 0,
            //arrays
            'option_value_description' => array(),
        );

        //option_value
        $option_value = array_merge($required, $data);

        return $option_value;

    }

}
