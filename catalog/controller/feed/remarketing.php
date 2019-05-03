<?php
class ControllerFeedRemarketing extends Controller {
	public function index() {
 
	$this->load->model('catalog/product');
	$this->load->model('tool/image');
	
	$filename = 'adwords.tsv';
	$fileplace = DIR_SYSTEM.$filename;
			$tocsv = array();
			$products = $this->model_catalog_product->getProducts();
			$tocsv[] = array('id', 'title', 'description', 'link', 'image_link', 'price', 'condition', 'availability', 'brand');
			
			foreach($products as $product){
				
				$tocsv[$product['product_id']]['id'] = $product['product_id'];
				$name = str_replace("'", "", str_replace('"', '', htmlspecialchars_decode($product['name'])));
				$tocsv[$product['product_id']]['title'] = $name;
				$tocsv[$product['product_id']]['description'] = $this->prepareField($product['meta_description']);
				$tocsv[$product['product_id']]['link'] = str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $product['product_id']));
				$tocsv[$product['product_id']]['image_link'] =  str_replace(' ', '%20', $this->model_tool_image->resize($product['image'], 300, 300));
				
				$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

				if ((float)$product['special']) {
					$special = $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}
				 
				$price_formatted = trim(preg_replace('/[^\d.]/','', ($special ? $special : $price)), '.').' '.$this->session->data['currency'];
				$tocsv[$product['product_id']]['price'] = $price_formatted;
				$tocsv[$product['product_id']]['condition'] = 'new';
				$tocsv[$product['product_id']]['availability'] = $product['quantity'] > 0 ? 'in stock' : 'out of stock';
				$tocsv[$product['product_id']]['brand'] = $product['manufacturer'];
				
			}
			
			$fp = fopen($fileplace, 'w');
			foreach ($tocsv as $fields) {
				fputcsv($fp, $fields, "\t");
			}
			fclose($fp);
			
						
			header('Content-type: application/octet-stream');
			header('Content-Length: '.filesize($fileplace)."'");
			header('Content-Disposition: attachment; filename="'.$filename.'"');

			readfile($fileplace);
			 
	}
	
		protected function prepareField($field) {
		$field = htmlspecialchars_decode($field);
		//Убираем не UTF-8 символы
		//@todo использовать github.com/neitanod/forceutf8 для их конвертации
		$field = mb_convert_encoding($field, 'UTF-8', 'UTF-8');
		if (strpos($field, '<![CDATA[') === 0) {
			return trim($field);
		}
		$field = strip_tags($field);
		$from = array('&nbsp;', '&', '"', '>', '<', '\'');
		$to = array(' ', '&amp;', '&quot;', '&gt;', '&lt;', '&apos;');
		$field = str_replace($from, $to, $field);
		/**
		if ($this->from_charset != 'windows-1251') {
			$field = iconv($this->from_charset, 'windows-1251//IGNORE', $field);
		}
		**/
		$field = preg_replace('#[\x00-\x08\x0B-\x0C\x0E-\x1F]+#is', ' ', $field);

		return trim($field);
	}
}
