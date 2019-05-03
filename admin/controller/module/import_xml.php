<?php
class ControllerModuleImportXml extends Controller {
	private $error = array(); 
	private $xml = '';

	public function index() {   
		$this->language->load('module/import_xml');
        $this->load->model('import/import_xml');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

            $this->load->library("importXML");

            $processor = new importXML($this->xml);

            $options = $processor->getWorksheet('Option')->data();

            foreach ($options as $option) {
                if($this->model_import_import_xml->isOption($option['option_id'])) $this->model_import_import_xml->deleteOption($option['option_id']);
                $this->model_import_import_xml->addOption($option, $option['option_id']);
            }

            $categories = $processor->getWorksheet('Category')->data();

            foreach ($categories as $category) {

                if($this->model_import_import_xml->isCategory($category['category_id'])) $this->model_import_import_xml->deleteCategory($category['category_id']);
                $this->model_import_import_xml->addCategory($category);
            }

            $products = $processor->getWorksheet('Product')->data();

            foreach ($products as $id => $product) {
                if($this->model_import_import_xml->isProduct($product['product_id'])) $this->model_import_import_xml->deleteProduct($product['product_id']);
                $this->model_import_import_xml->addProduct($product);
            }

			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');

		$this->data['entry_file'] = $this->language->get('entry_file');

		$this->data['button_import'] = $this->language->get('button_import');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
 		if (isset($this->error['file'])) {
			$this->data['error_file'] = $this->error['file'];
		} else {
			$this->data['error_file'] = '';
		}
		
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/import_xml', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/import_xml', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->template = 'module/import_xml.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/import_xml')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

        if (!$this->request->files) {
            $this->error['file'] = $this->language->get('error_upload');
            return false;
        }

        $max_filesize = ini_get('upload_max_filesize');

		if (!$this->request->files['import_xml_file']['tmp_name']) {
			$this->error['file'] = $this->language->get('error_file');
		}elseif((int)$max_filesize < $this->request->files['import_xml_file']['size'] / 1000000){
            $this->error['file'] = sprintf($this->language->get('error_max_filesize'), $max_filesize);
        }elseif($this->request->files['import_xml_file']['type'] != 'text/xml'){
            $this->error['file'] = $this->language->get('error_type');
        }else{
            $this->xml = $this->request->files['import_xml_file']['tmp_name'];
        }
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
