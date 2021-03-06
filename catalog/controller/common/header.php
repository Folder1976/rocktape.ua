<?php   
class ControllerCommonHeader extends Controller {
	protected function index() {
		$this->data['title'] = $this->document->getTitle();

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (isset($this->session->data['error']) && !empty($this->session->data['error'])) {
			$this->data['error'] = $this->session->data['error'];

			unset($this->session->data['error']);
		} else {
			$this->data['error'] = '';
		}
        
        if(isset($this->session->data['order_info'])){
            $this->data['order_info'] = $this->session->data['order_info'];
            $this->data['order_products'] = $this->session->data['order_products'];
            unset($this->session->data['order_info']);
            unset($this->session->data['order_products']);
        }

		$this->data['base'] = $server;
		$this->data['description'] = $this->document->getDescription();
		$this->data['keywords'] = $this->document->getKeywords();
		$this->data['links'] = $this->document->getLinks();	 
		$this->data['styles'] = $this->document->getStyles();
		$this->data['scripts'] = $this->document->getScripts();
		$this->data['lang'] = $this->language->get('code');
		$this->data['direction'] = $this->language->get('direction');
		$this->data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
		$this->data['name'] = $this->config->get('config_name');

		if ($this->config->get('config_icon') && file_exists(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->data['icon'] = $server . 'image/' . $this->config->get('config_icon');
		} else {
			$this->data['icon'] = '';
		}

		if ($this->config->get('config_logo') && file_exists(DIR_IMAGE . $this->config->get('config_logo'))) {
			$this->data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$this->data['logo'] = '';
		}		

		$this->language->load('common/header');

		$this->data['text_home'] = $this->language->get('text_home');
		$this->data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		$this->data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$this->data['text_search'] = $this->language->get('text_search');
		$this->data['text_welcome'] = sprintf($this->language->get('text_welcome'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));
		$this->data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));
		$this->data['text_account'] = $this->language->get('text_account');
		$this->data['text_checkout'] = $this->language->get('text_checkout');
		$this->data['text_contact'] = $this->language->get('text_contact');
		$this->data['text_shipping'] = $this->language->get('text_shipping');
		$this->data['text_blog'] = $this->language->get('text_blog');

		$this->data['home'] = HTTP_SERVER;
		$this->data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$this->data['logged'] = $this->customer->isLogged();
		$this->data['account'] = $this->url->link('account/account', '', 'SSL');
		$this->data['shopping_cart'] = $this->url->link('checkout/cart');
		$this->data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		$this->data['contact'] = HTTP_SERVER . 'contact-info';
		$this->data['shipping'] = HTTP_SERVER . 'dostavka';
		$this->data['blog'] = $this->url->link('pavblog/category&id=24');
		if($this->config->get('config_seo_url')){
            $this->data['seo_search'] = "seo-search";
        }else{
            $this->data['seo_search'] = "";
        }

		// Daniel's robot detector
		$status = true;

		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", trim($this->config->get('config_robots')));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;

					break;
				}
			}
		}

		// A dirty hack to try to set a cookie for the multi-store feature
		$this->load->model('setting/store');

		$this->data['stores'] = array();

		if ($this->config->get('config_shared') && $status) {
			$this->data['stores'][] = $server . 'catalog/view/javascript/crossdomain.php?session_id=' . $this->session->getId();

			$stores = $this->model_setting_store->getStores();

			foreach ($stores as $store) {
				$this->data['stores'][] = $store['url'] . 'catalog/view/javascript/crossdomain.php?session_id=' . $this->session->getId();
			}
		}

		// Search		
		if (isset($this->request->get['search'])) {
			$this->data['search'] = $this->request->get['search'];
		} else {
			$this->data['search'] = '';
		}

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$product_total = $this->model_catalog_product->getTotalProducts($data);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);						
				}

				// Level 1
				$this->data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
				
			}
		}

		// Menu
		$this->load->model('catalog/blog');

		$this->data['blogs'] = array();

		$categories = $this->model_catalog_blog->getCategories(0);

		foreach ($categories as $blog) {
			if ($blog['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_blog->getCategories($blog['blog_id']);

				foreach ($children as $child) {
					$data = array(
						'filter_blog_id'  => $child['blog_id'],
						'filter_sub_blog' => true
					);

					$children_data[] = array(
						'name'  => $child['name'],
						'href'  => str_replace('%23', '#', $this->url->link('product/blog', 'blogpath=' . $blog['blog_id'] . '_' . $child['blog_id'])),
					);						
				}

				// Level 1
				$this->data['blogs'][] = array(
					'blog_id'     => $blog['blog_id'],
					'name'     => $blog['name'],
					'children' => $children_data,
					'column'   => $blog['column'] ? $blog['column'] : 1,
					'href'     => $this->url->link('product/blog', 'blogpath=' . $blog['blog_id']),
				);
			}
				
		}

		$this->children = array(
			'module/language',
			'module/currency',
			'module/cart'
		);

		
		$this->load->model('design/banner');
		
		// =================================================================		
		$this->data['home_slider'] = array();
		$results = $this->model_design_banner->getBanner(11);
		foreach ($results as $result) {
			$this->data['home_slider'][] = array(
				'title' => $result['title'],
				'btn_href'  => $result['link'],
				'image' => '/image/'.$result['image'],
				'text'                  => $result['text'],
				'btn_text'              => $result['btn_text'],
				'background'            => $result['background'],
				'background_btn'        => $result['background_btn'],
	
			);
		}
		
		// =================================================================		
		$this->data['home_slider1'] = array();
		$results = $this->model_design_banner->getBanner(12);
		foreach ($results as $result) {
			$this->data['home_slider1'][] = array(
				'title' => $result['title'],
				'btn_href'  => $result['link'],
				'image' => '/image/'.$result['image'],
				'text'                  => $result['text'],
				'btn_text'              => $result['btn_text'],
				'background'            => $result['background'],
				'background_btn'        => $result['background_btn'],
	
			);
		}
		
		// =================================================================		
		$this->data['home_slider2'] = array();
		$results = $this->model_design_banner->getBanner(13);
		foreach ($results as $result) {
			$this->data['home_slider2'][] = array(
				'title' => $result['title'],
				'btn_href'  => $result['link'],
				'image' => '/image/'.$result['image'],
				'text'                  => $result['text'],
				'btn_text'              => $result['btn_text'],
				'background'            => $result['background'],
				'background_btn'        => $result['background_btn'],
	
			);
		}
		
		$module_data = array();

		$this->load->model('setting/extension');

		$extensions = $this->model_setting_extension->getExtensions('module');		
		
		foreach ($extensions as $extension) {
			$modules = $this->config->get($extension['code'] . '_module');

			if ($modules) {
				foreach ($modules as $module) {
					if ($module['layout_id'] == 1 && $module['position'] == 'content_top' && $module['status']) {
						$module_data[] = array(
							'code'       => $extension['code'],
							'setting'    => $module,
							'sort_order' => $module['sort_order']
						);				
					}
				}
			}
		}
				$sort_order = array(); 

		foreach ($module_data as $key => $value) {
			$sort_order[$key] = $value['sort_order'];
		}

		array_multisort($sort_order, SORT_ASC, $module_data);

		$this->data['content_top_modules'] = array();

		foreach ($module_data as $module) {
			$module = $this->getChild('module/' . $module['code'], $module['setting']);

			if ($module) {
				$this->data['content_top_modules'][] = $module;
			}
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/header.tpl';
		} else {
			$this->template = 'default/template/common/header.tpl';
		}

		$this->render();
	} 	
}
?>

