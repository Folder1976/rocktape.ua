<?php 
class ModelCatalogAttribute extends Model {

	public function getAttributes() {
		$product_attribute_group_data = array();
		$product_attribute_data = array();
		
		$product_attribute_group_query = $this->db->query("SELECT ag.attribute_group_id, agd.name, agd.link FROM " . DB_PREFIX . "attribute a 
														  LEFT JOIN " . DB_PREFIX . "attribute_group ag ON (a.attribute_group_id = ag.attribute_group_id)
														  LEFT JOIN " . DB_PREFIX . "attribute_group_description agd ON (ag.attribute_group_id = agd.attribute_group_id)
														  WHERE agd.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY ag.attribute_group_id ORDER BY ag.sort_order, agd.name");

		foreach ($product_attribute_group_query->rows as $product_attribute_group) {
			

			$product_attribute_query = $this->db->query("SELECT a.attribute_id, ad.name , ad.date FROM " . DB_PREFIX . "attribute a 
														LEFT JOIN " . DB_PREFIX . "attribute_description ad ON (a.attribute_id = ad.attribute_id)
														WHERE a.attribute_group_id = '" . (int)$product_attribute_group['attribute_group_id'] . "' AND
														ad.language_id = '" . (int)$this->config->get('config_language_id') . "'
														ORDER BY ad.date ASC, a.sort_order, ad.name");

			foreach ($product_attribute_query->rows as $product_attribute) {
				$product_attribute_data[] = array(
					'attribute_id' => $product_attribute['attribute_id'],
					'name'         => $product_attribute['name'],
					'date'         => $product_attribute['date'],
					'group_name'               => $product_attribute_group['name'],
					'link'               => $product_attribute_group['link'],
					'text'         => $product_attribute['text']		 	
				);
			}
			/*
			$product_attribute_group_data[] = array(
				'attribute_group_id' => $product_attribute_group['attribute_group_id'],
				'name'               => $product_attribute_group['name'],
				'link'               => $product_attribute_group['link'],
				'attribute'          => $product_attribute_data
			);
			*/
		}

		return $product_attribute_data;
	}
	
	
	public function getGroupAttributes() {
		$product_attribute_group_data = array();
		
		$product_attribute_group_query = $this->db->query("SELECT ag.attribute_group_id, agd.name , agd.link 
														  FROM " . DB_PREFIX . "attribute_group ag 
														  LEFT JOIN " . DB_PREFIX . "attribute_group_description agd ON (ag.attribute_group_id = agd.attribute_group_id)
														  WHERE agd.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY ag.attribute_group_id ORDER BY ag.sort_order, agd.name");

		foreach ($product_attribute_group_query->rows as $product_attribute_group) {

			$product_attribute_group_data[] = array(
				'attribute_group_id' => $product_attribute_group['attribute_group_id'],
				'name'               => $product_attribute_group['name'],
				'link'               => $product_attribute_group['link'],
				
			);
		}

		return $product_attribute_group_data;
	}
	
}
