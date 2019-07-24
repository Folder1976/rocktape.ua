<?php 
class ControllerProductBlog extends Controller {  
	public function index() { 
		$this->language->load('product/blog');

		$this->load->model('catalog/blog');

		$this->load->model('tool/image'); 

		if (isset($this->request->get['filter'])) {
			$filter = $this->request->get['filter'];
		} else {
			$filter = '';
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}	

		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get('config_catalog_limit');
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);

		if (isset($this->request->get['blogpath'])) {
			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}	

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$path = '';

			$parts = explode('_', (string)$this->request->get['blogpath']);

			$blog_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}

				$blog_info = $this->model_catalog_blog->getCategory($path_id);

				if ($blog_info) {
					$this->data['breadcrumbs'][] = array(
						'text'      => $blog_info['name'],
						'href'      => $this->url->link('product/blog', 'blogpath=' . $path . $url),
						'separator' => $this->language->get('text_separator')
					);
				}
			}
		} else {
			$blog_id = 0;
		}

		$this->load->model('design/banner');
		$this->load->model('tool/image');
		$this->load->model('catalog/attribute');

		$this->data['blog_id'] = (int)$blog_id;
		
		$attributes = $this->model_catalog_attribute->getAttributes();
		$this->data['attribute_groups'] = $this->model_catalog_attribute->getGroupAttributes();
		
		$this->data['attributes'] = array();
		
		if($blog_id == 12){
			$this->data['attributes'] = $attributes;
		}else{
			foreach($attributes as $attr){
				if((int)$attr['blog_id'] == (int)$blog_id){
					$this->data['attributes'][] = $attr;
				}
			}
		}
		
		$width = 278;
		$width_h = 1080;
		
		$height = 188;
		$height_h = 721;
		
		
		
		if($blog_id == 2){
			$this->data['banners'] = array();
			$results = $this->model_design_banner->getBanner(14);
			foreach ($results as $result) {
				if (file_exists(DIR_IMAGE . $result['image'])) {
					$this->data['banners'][] = array(
						'title' => $result['title'],
						'link'  => $result['link'],
						'text'  => $result['text'],
						'btn_text'  => $result['btn_text'],
						'background'  => $result['background'],
						'background_btn'  => $result['background_btn'],
						'image' => $this->model_tool_image->resize($result['image'], $width, $height),
					);
				}
			}
			
		}elseif($blog_id == 8){
			$this->data['images'] = array();
			$results = $this->model_design_banner->getBanner(15);
			foreach ($results as $result) {
				if (file_exists(DIR_IMAGE . $result['image'])) {
					$this->data['images'][] = array(
						'title' => $result['title'],
						'image_min' => $this->model_tool_image->resize($result['image'], $width, $height),
						'image' => $this->model_tool_image->resize($result['image'], $width_h, $height_h),
					);
				}
			}
			
		}elseif($blog_id == 3){
			$this->data['images'] = array();
			$results = $this->model_design_banner->getBanner(16);
			foreach ($results as $result) {
				if (file_exists(DIR_IMAGE . $result['image'])) {
					$this->data['images'][] = array(
						'title' => $result['title'],
						'image_min' => $this->model_tool_image->resize($result['image'], $width, $height),
						'image' => $this->model_tool_image->resize($result['image'], $width_h, $height_h),
					);
				}
			}
			
		}elseif($blog_id == 4){
			$this->data['images'] = array();
			$results = $this->model_design_banner->getBanner(17);
			foreach ($results as $result) {
				if (file_exists(DIR_IMAGE . $result['image'])) {
					$this->data['images'][] = array(
						'title' => $result['title'],
						'image_min' => $this->model_tool_image->resize($result['image'], $width, $height),
						'image' => $this->model_tool_image->resize($result['image'], $width_h, $height_h),
					);
				}
			}
			
		}elseif($blog_id == 5){
			$this->data['images'] = array();
			$results = $this->model_design_banner->getBanner(18);
			foreach ($results as $result) {
				if (file_exists(DIR_IMAGE . $result['image'])) {
					$this->data['images'][] = array(
						'title' => $result['title'],
						'image_min' => $this->model_tool_image->resize($result['image'], $width, $height),
						'image' => $this->model_tool_image->resize($result['image'], $width_h, $height_h),
					);
				}
			}
			
		}elseif($blog_id == 6){
			$this->data['images'] = array();
			$results = $this->model_design_banner->getBanner(19);
			foreach ($results as $result) {
				if (file_exists(DIR_IMAGE . $result['image'])) {
					$this->data['images'][] = array(
						'title' => $result['title'],
						'image_min' => $this->model_tool_image->resize($result['image'], $width, $height),
						'image' => $this->model_tool_image->resize($result['image'], $width_h, $height_h),
					);
				}
			}
			
		}elseif($blog_id == 7){
			$this->data['images'] = array();
			$results = $this->model_design_banner->getBanner(20);
			foreach ($results as $result) {
				if (file_exists(DIR_IMAGE . $result['image'])) {
					$this->data['images'][] = array(
						'title' => $result['title'],
						'image_min' => $this->model_tool_image->resize($result['image'], $width, $height),
						'image' => $this->model_tool_image->resize($result['image'], $width_h, $height_h),
					);
				}
			}
	
			}elseif($blog_id == 1){
			$this->data['images'] = array();
			$results = $this->model_design_banner->getBanner(21);
			foreach ($results as $result) {
				if (file_exists(DIR_IMAGE . $result['image'])) {
					$this->data['images'][] = array(
						'title' => $result['title'],
						'image_min' => $this->model_tool_image->resize($result['image'], $width, $height),
						'image' => $this->model_tool_image->resize($result['image'], $width_h, $height_h),
					);
				}
			}
			
		}
		
		$blog_info = $this->model_catalog_blog->getCategory($blog_id);

		if ($blog_info) {
			$this->document->setTitle($blog_info['name']);
			$this->document->setDescription($blog_info['meta_description']);
			$this->document->setKeywords($blog_info['meta_keyword']);
			$this->document->addScript('catalog/view/javascript/jquery/jquery.total-storage.min.js');

			$this->data['heading_title'] = $blog_info['name'];

			$this->data['text_refine'] = $this->language->get('text_refine');
			$this->data['text_empty'] = $this->language->get('text_empty');			
			$this->data['text_quantity'] = $this->language->get('text_quantity');
			$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$this->data['text_model'] = $this->language->get('text_model');
			$this->data['text_price'] = $this->language->get('text_price');
			$this->data['text_tax'] = $this->language->get('text_tax');
			$this->data['text_points'] = $this->language->get('text_points');
			$this->data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
			$this->data['text_display'] = $this->language->get('text_display');
			$this->data['text_list'] = $this->language->get('text_list');
			$this->data['text_grid'] = $this->language->get('text_grid');
			$this->data['text_sort'] = $this->language->get('text_sort');
			$this->data['text_limit'] = $this->language->get('text_limit');

			$this->data['button_cart'] = $this->language->get('button_cart');
			$this->data['button_wishlist'] = $this->language->get('button_wishlist');
			$this->data['button_compare'] = $this->language->get('button_compare');
			$this->data['button_continue'] = $this->language->get('button_continue');

			// Set the last blog breadcrumb		
			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}	

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$this->data['breadcrumbs'][] = array(
				'text'      => $blog_info['name'],
				'href'      => $this->url->link('product/blog', 'path=' . $this->request->get['path']),
				'separator' => $this->language->get('text_separator')
			);

			if ($blog_info['image']) {
				$this->data['thumb'] = $this->model_tool_image->resize($blog_info['image'], $this->config->get('config_image_blog_width'), $this->config->get('config_image_blog_height'));
			} else {
				$this->data['thumb'] = '';
			}

			$this->data['video_src'] = explode(';', trim($blog_info['video_src'], ';'));
			$this->data['name'] = html_entity_decode($blog_info['name'], ENT_QUOTES, 'UTF-8');
			$this->data['name1'] = html_entity_decode($blog_info['name1'], ENT_QUOTES, 'UTF-8');
			$this->data['name2'] = html_entity_decode($blog_info['name2'], ENT_QUOTES, 'UTF-8');
			$this->data['name3'] = html_entity_decode($blog_info['name3'], ENT_QUOTES, 'UTF-8');
			$this->data['name4'] = html_entity_decode($blog_info['name4'], ENT_QUOTES, 'UTF-8');
			$this->data['name5'] = html_entity_decode($blog_info['name5'], ENT_QUOTES, 'UTF-8');
			$this->data['name6'] = html_entity_decode($blog_info['name6'], ENT_QUOTES, 'UTF-8');
			$this->data['name7'] = html_entity_decode($blog_info['name7'], ENT_QUOTES, 'UTF-8');
			$this->data['name8'] = html_entity_decode($blog_info['name8'], ENT_QUOTES, 'UTF-8');
			$this->data['name9'] = html_entity_decode($blog_info['name9'], ENT_QUOTES, 'UTF-8');
			$this->data['name0'] = html_entity_decode($blog_info['name0'], ENT_QUOTES, 'UTF-8');
			$this->data['name11'] = html_entity_decode($blog_info['name11'], ENT_QUOTES, 'UTF-8');
			$this->data['name12'] = html_entity_decode($blog_info['name12'], ENT_QUOTES, 'UTF-8');
			$this->data['name13'] = html_entity_decode($blog_info['name13'], ENT_QUOTES, 'UTF-8');
			$this->data['name14'] = html_entity_decode($blog_info['name14'], ENT_QUOTES, 'UTF-8');
			$this->data['name15'] = html_entity_decode($blog_info['name15'], ENT_QUOTES, 'UTF-8');
			
			$this->data['description'] = html_entity_decode($blog_info['description'], ENT_QUOTES, 'UTF-8');
			$this->data['description1'] = html_entity_decode($blog_info['description1'], ENT_QUOTES, 'UTF-8');
			$this->data['description2'] = html_entity_decode($blog_info['description2'], ENT_QUOTES, 'UTF-8');
			$this->data['description3'] = html_entity_decode($blog_info['description3'], ENT_QUOTES, 'UTF-8');
			$this->data['description4'] = html_entity_decode($blog_info['description4'], ENT_QUOTES, 'UTF-8');
			$this->data['description5'] = html_entity_decode($blog_info['description5'], ENT_QUOTES, 'UTF-8');
			$this->data['description6'] = html_entity_decode($blog_info['description6'], ENT_QUOTES, 'UTF-8');
			$this->data['description7'] = html_entity_decode($blog_info['description7'], ENT_QUOTES, 'UTF-8');
			$this->data['description8'] = html_entity_decode($blog_info['description8'], ENT_QUOTES, 'UTF-8');
			$this->data['description9'] = html_entity_decode($blog_info['description9'], ENT_QUOTES, 'UTF-8');
			$this->data['description0'] = html_entity_decode($blog_info['description0'], ENT_QUOTES, 'UTF-8');
			$this->data['description11'] = html_entity_decode($blog_info['description11'], ENT_QUOTES, 'UTF-8');
			$this->data['description12'] = html_entity_decode($blog_info['description12'], ENT_QUOTES, 'UTF-8');
			$this->data['description13'] = html_entity_decode($blog_info['description13'], ENT_QUOTES, 'UTF-8');
			$this->data['description14'] = html_entity_decode($blog_info['description14'], ENT_QUOTES, 'UTF-8');
			$this->data['description15'] = html_entity_decode($blog_info['description15'], ENT_QUOTES, 'UTF-8');
			$this->data['compare'] = $this->url->link('product/compare');

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}	

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}	

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$this->data['categories'] = array();

			$results = $this->model_catalog_blog->getCategories($blog_id);

			foreach ($results as $result) {
				$data = array(
					'filter_blog_id'  => $result['blog_id'],
					'filter_sub_blog' => true
				);

				$this->data['categories'][] = array(
					'name'  => $result['name'],
					'href'  => $this->url->link('product/blog', 'blogpath=' . $this->request->get['path'] . '_' . $result['blog_id'] . $url)
				);
			}

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$this->data['sorts'] = array();

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/blog', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url)
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/blog', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/blog', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/blog', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
			); 

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/blog', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
			); 

			if ($this->config->get('config_review_status')) {
				$this->data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',
					'href'  => $this->url->link('product/blog', 'path=' . $this->request->get['path'] . '&sort=rating&order=DESC' . $url)
				); 

				$this->data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',
					'href'  => $this->url->link('product/blog', 'path=' . $this->request->get['path'] . '&sort=rating&order=ASC' . $url)
				);
			}

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/blog', 'path=' . $this->request->get['path'] . '&sort=p.model&order=ASC' . $url)
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('product/blog', 'path=' . $this->request->get['path'] . '&sort=p.model&order=DESC' . $url)
			);

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			$this->data['limits'] = array();

			$limits = array_unique(array($this->config->get('config_catalog_limit'), 25, 50, 75, 100));

			sort($limits);

			foreach($limits as $value){
				$this->data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('product/blog', 'path=' . $this->request->get['path'] . $url . '&limit=' . $value)
				);
			}

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('product/blog', 'path=' . $this->request->get['path'] . $url . '&page={page}');

			$this->data['pagination'] = $pagination->render();

			$this->data['sort'] = $sort;
			$this->data['order'] = $order;
			$this->data['limit'] = $limit;

			$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/blog'.$blog_id.'.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/product/blog'.$blog_id.'.tpl';
			}elseif (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/blog.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/product/blog.tpl';
			} else {
				$this->template = 'default/template/product/blog.tpl';
			}

			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);

			$this->response->setOutput($this->render());										
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('product/blog', $url),
				'separator' => $this->language->get('text_separator')
			);

			$this->document->setTitle($this->language->get('text_error'));

			$this->data['heading_title'] = $this->language->get('text_error');

			$this->data['text_error'] = $this->language->get('text_error');

			$this->data['button_continue'] = $this->language->get('button_continue');

			$this->data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . '/1.1 404 Not Found');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
			}

			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);

			$this->response->setOutput($this->render());
		}
	}
}
?>
