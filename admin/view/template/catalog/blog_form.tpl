<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/blog.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <div id="tabs" class="htabs"><a href="#tab-general"><?php echo $tab_general; ?></a><a href="#tab-data"><?php echo $tab_data; ?></a><a href="#tab-design"><?php echo $tab_design; ?></a></div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-general">
          <div id="languages" class="htabs">
            <?php foreach ($languages as $language) { ?>
            <a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
            <?php } ?>
          </div>
          <?php foreach ($languages as $language) { ?>
          <div id="language<?php echo $language['language_id']; ?>">
            <table class="form">
              <tr>
                <td><span class="required">*</span> <?php echo $entry_name; ?></td>
                <td><input type="text" name="blog_description[<?php echo $language['language_id']; ?>][name]" size="100" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['name'] : ''; ?>" />
                  <?php if (isset($error_name[$language['language_id']])) { ?>
                  <span class="error"><?php echo $error_name[$language['language_id']]; ?></span>
                  <?php } ?></td>
              </tr>
              <tr>
                <td>Линки на видео, через ;</td>
                <td>
                  <input type="text" name="blog_description[<?php echo $language['language_id']; ?>][video_src]" size="100" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['video_src'] : ''; ?>" />
                </td>
              </tr>
             <tr>
                <td><?php echo $entry_meta_description; ?></td>
                <td><textarea name="blog_description[<?php echo $language['language_id']; ?>][meta_description]" cols="40" rows="5"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['meta_description'] : ''; ?></textarea></td>
              </tr>
              <tr>
                <td><?php echo $entry_meta_keyword; ?></td>
                <td><textarea name="blog_description[<?php echo $language['language_id']; ?>][meta_keyword]" cols="40" rows="5"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea></td>
              </tr>
              <tr>
                <td><?php echo $entry_description; ?></td>
                <td><textarea name="blog_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['description'] : ''; ?></textarea></td>
              </tr>
  
              <tr>
                <td colspan="2"><h2>Блок 1</h2></td>
              </tr>
              <tr>
                <td><?php echo $entry_name; ?> 1</td>
                <td><input type="text" name="blog_description[<?php echo $language['language_id']; ?>][name1]" size="100" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['name1'] : ''; ?>" />
              </tr>
              <tr>
                <td><?php echo $entry_description; ?> 1</td>
                <td><textarea name="blog_description[<?php echo $language['language_id']; ?>][description1]" id="description1<?php echo $language['language_id']; ?>"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['description1'] : ''; ?></textarea></td>
              </tr>
  
             <tr>
                <td colspan="2"><h2>Блок 2</h2></td>
              </tr>
              <tr>
                <td><?php echo $entry_name; ?> 2</td>
                <td><input type="text" name="blog_description[<?php echo $language['language_id']; ?>][name2]" size="100" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['name2'] : ''; ?>" />
              </tr>
              <tr>
                <td><?php echo $entry_description; ?> 2</td>
                <td><textarea name="blog_description[<?php echo $language['language_id']; ?>][description2]" id="description2<?php echo $language['language_id']; ?>"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['description2'] : ''; ?></textarea></td>
              </tr>
  
             <tr>
                <td colspan="2"><h2>Блок 3</h2></td>
              </tr>
              <tr>
                <td><?php echo $entry_name; ?> 3</td>
                <td><input type="text" name="blog_description[<?php echo $language['language_id']; ?>][name3]" size="100" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['name3'] : ''; ?>" />
              </tr>
              <tr>
                <td><?php echo $entry_description; ?> 3</td>
                <td><textarea name="blog_description[<?php echo $language['language_id']; ?>][description3]" id="description3<?php echo $language['language_id']; ?>"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['description3'] : ''; ?></textarea></td>
              </tr>
  
             <tr>
                <td colspan="2"><h2>Блок 4</h2></td>
              </tr>
              <tr>
                <td><?php echo $entry_name; ?> 4</td>
                <td><input type="text" name="blog_description[<?php echo $language['language_id']; ?>][name4]" size="100" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['name4'] : ''; ?>" />
              </tr>
              <tr>
                <td><?php echo $entry_description; ?> 4</td>
                <td><textarea name="blog_description[<?php echo $language['language_id']; ?>][description4]" id="description4<?php echo $language['language_id']; ?>"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['description4'] : ''; ?></textarea></td>
              </tr>
  
             <tr>
                <td colspan="2"><h2>Блок 5</h2></td>
              </tr>
              <tr>
                <td><?php echo $entry_name; ?> 5</td>
                <td><input type="text" name="blog_description[<?php echo $language['language_id']; ?>][name5]" size="100" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['name5'] : ''; ?>" />
              </tr>
              <tr>
                <td><?php echo $entry_description; ?> 5</td>
                <td><textarea name="blog_description[<?php echo $language['language_id']; ?>][description5]" id="description5<?php echo $language['language_id']; ?>"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['description5'] : ''; ?></textarea></td>
              </tr>
  
             <tr>
                <td colspan="2"><h2>Блок 6</h2></td>
              </tr>
              <tr>
                <td><?php echo $entry_name; ?> 6</td>
                <td><input type="text" name="blog_description[<?php echo $language['language_id']; ?>][name6]" size="100" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['name6'] : ''; ?>" />
              </tr>
              <tr>
                <td><?php echo $entry_description; ?> 6</td>
                <td><textarea name="blog_description[<?php echo $language['language_id']; ?>][description6]" id="description6<?php echo $language['language_id']; ?>"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['description6'] : ''; ?></textarea></td>
              </tr>
  
             <tr>
                <td colspan="2"><h2>Блок 7</h2></td>
              </tr>
              <tr>
                <td><?php echo $entry_name; ?> 7</td>
                <td><input type="text" name="blog_description[<?php echo $language['language_id']; ?>][name7]" size="100" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['name7'] : ''; ?>" />
              </tr>
              <tr>
                <td><?php echo $entry_description; ?> 7</td>
                <td><textarea name="blog_description[<?php echo $language['language_id']; ?>][description7]" id="description7<?php echo $language['language_id']; ?>"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['description7'] : ''; ?></textarea></td>
              </tr>
  
             <tr>
                <td colspan="2"><h2>Блок 8</h2></td>
              </tr>
              <tr>
                <td><?php echo $entry_name; ?> 8</td>
                <td><input type="text" name="blog_description[<?php echo $language['language_id']; ?>][name8]" size="100" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['name8'] : ''; ?>" />
              </tr>
              <tr>
                <td><?php echo $entry_description; ?> 8</td>
                <td><textarea name="blog_description[<?php echo $language['language_id']; ?>][description8]" id="description8<?php echo $language['language_id']; ?>"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['description8'] : ''; ?></textarea></td>
              </tr>
  
             <tr>
                <td colspan="2"><h2>Блок 9</h2></td>
              </tr>
              <tr>
                <td><?php echo $entry_name; ?> 9</td>
                <td><input type="text" name="blog_description[<?php echo $language['language_id']; ?>][name9]" size="100" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['name9'] : ''; ?>" />
              </tr>
              <tr>
                <td><?php echo $entry_description; ?> 9</td>
                <td><textarea name="blog_description[<?php echo $language['language_id']; ?>][description9]" id="description9<?php echo $language['language_id']; ?>"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['description9'] : ''; ?></textarea></td>
              </tr>
  
             <tr>
                <td colspan="2"><h2>Блок 10</h2></td>
              </tr>
              <tr>
                <td><?php echo $entry_name; ?> 10</td>
                <td><input type="text" name="blog_description[<?php echo $language['language_id']; ?>][name0]" size="100" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['name0'] : ''; ?>" />
              </tr>
              <tr>
                <td><?php echo $entry_description; ?> 10</td>
                <td><textarea name="blog_description[<?php echo $language['language_id']; ?>][description0]" id="description0<?php echo $language['language_id']; ?>"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['description0'] : ''; ?></textarea></td>
              </tr>
  
              <tr>
                <td colspan="2"><h2>Блок 11</h2></td>
              </tr>
              <tr>
                <td><?php echo $entry_name; ?> 11</td>
                <td><input type="text" name="blog_description[<?php echo $language['language_id']; ?>][name11]" size="100" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['name11'] : ''; ?>" />
              </tr>
              <tr>
                <td><?php echo $entry_description; ?> 11</td>
                <td><textarea name="blog_description[<?php echo $language['language_id']; ?>][description11]" id="description11<?php echo $language['language_id']; ?>"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['description11'] : ''; ?></textarea></td>
              </tr>
  
              <tr>
                <td colspan="2"><h2>Блок 12</h2></td>
              </tr>
              <tr>
                <td><?php echo $entry_name; ?> 12</td>
                <td><input type="text" name="blog_description[<?php echo $language['language_id']; ?>][name12]" size="100" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['name12'] : ''; ?>" />
              </tr>
              <tr>
                <td><?php echo $entry_description; ?> 12</td>
                <td><textarea name="blog_description[<?php echo $language['language_id']; ?>][description12]" id="description12<?php echo $language['language_id']; ?>"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['description12'] : ''; ?></textarea></td>
              </tr>
  
              <tr>
                <td colspan="2"><h2>Блок 13</h2></td>
              </tr>
              <tr>
                <td><?php echo $entry_name; ?> 13</td>
                <td><input type="text" name="blog_description[<?php echo $language['language_id']; ?>][name13]" size="100" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['name13'] : ''; ?>" />
              </tr>
              <tr>
                <td><?php echo $entry_description; ?> 13</td>
                <td><textarea name="blog_description[<?php echo $language['language_id']; ?>][description13]" id="description13<?php echo $language['language_id']; ?>"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['description13'] : ''; ?></textarea></td>
              </tr>
  
              <tr>
                <td colspan="2"><h2>Блок 14</h2></td>
              </tr>
              <tr>
                <td><?php echo $entry_name; ?> 14</td>
                <td><input type="text" name="blog_description[<?php echo $language['language_id']; ?>][name14]" size="100" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['name14'] : ''; ?>" />
              </tr>
              <tr>
                <td><?php echo $entry_description; ?> 14</td>
                <td><textarea name="blog_description[<?php echo $language['language_id']; ?>][description14]" id="description14<?php echo $language['language_id']; ?>"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['description14'] : ''; ?></textarea></td>
              </tr>
  
              <tr>
                <td colspan="2"><h2>Блок 15</h2></td>
              </tr>
              <tr>
                <td><?php echo $entry_name; ?> 15</td>
                <td><input type="text" name="blog_description[<?php echo $language['language_id']; ?>][name15]" size="100" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['name15'] : ''; ?>" />
              </tr>
              <tr>
                <td><?php echo $entry_description; ?> 15</td>
                <td><textarea name="blog_description[<?php echo $language['language_id']; ?>][description15]" id="description15<?php echo $language['language_id']; ?>"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['description15'] : ''; ?></textarea></td>
              </tr>
  

            </table>
          </div>
          <?php } ?>
        </div>
        <div id="tab-data">
          <table class="form">
            <tr>
              <td><?php echo $entry_parent; ?></td>
              <td><input type="text" name="path" value="<?php echo $path; ?>" size="100" />
                <input type="hidden" name="parent_id" value="<?php echo $parent_id; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_filter; ?></td>
              <td><input type="text" name="filter" value="" /></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><div id="blog-filter" class="scrollbox">
                  <?php $class = 'odd'; ?>
                  <?php foreach ($blog_filters as $blog_filter) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div id="blog-filter<?php echo $blog_filter['filter_id']; ?>" class="<?php echo $class; ?>"><?php echo $blog_filter['name']; ?><img src="view/image/delete.png" alt="" />
                    <input type="hidden" name="blog_filter[]" value="<?php echo $blog_filter['filter_id']; ?>" />
                  </div>
                  <?php } ?>
                </div></td>
            </tr>
            <tr>
              <td><?php echo $entry_store; ?></td>
              <td><div class="scrollbox">
                  <?php $class = 'even'; ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array(0, $blog_store)) { ?>
                    <input type="checkbox" name="blog_store[]" value="0" checked="checked" />
                    <?php echo $text_default; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="blog_store[]" value="0" />
                    <?php echo $text_default; ?>
                    <?php } ?>
                  </div>
                  <?php foreach ($stores as $store) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array($store['store_id'], $blog_store)) { ?>
                    <input type="checkbox" name="blog_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                    <?php echo $store['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="blog_store[]" value="<?php echo $store['store_id']; ?>" />
                    <?php echo $store['name']; ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div></td>
            </tr>
            <tr>
              <td><?php echo $entry_keyword; ?></td>
              <td><input type="text" name="keyword" value="<?php echo $keyword; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_image; ?></td>
              <td valign="top"><div class="image"><img src="<?php echo $thumb; ?>" alt="" id="thumb" />
                  <input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
                  <br />
                  <a onclick="image_upload('image', 'thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
            </tr>
            <tr>
              <td><?php echo $entry_top; ?></td>
              <td><?php if ($top) { ?>
                <input type="checkbox" name="top" value="1" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="top" value="1" />
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_column; ?></td>
              <td><input type="text" name="column" value="<?php echo $column; ?>" size="1" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_sort_order; ?></td>
              <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="1" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_status; ?></td>
              <td><select name="status">
                  <?php if ($status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
        </div>
        <div id="tab-design">
          <table class="list">
            <thead>
              <tr>
                <td class="left"><?php echo $entry_store; ?></td>
                <td class="left"><?php echo $entry_layout; ?></td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="left"><?php echo $text_default; ?></td>
                <td class="left"><select name="blog_layout[0][layout_id]">
                    <option value=""></option>
                    <?php foreach ($layouts as $layout) { ?>
                    <?php if (isset($blog_layout[0]) && $blog_layout[0] == $layout['layout_id']) { ?>
                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select></td>
              </tr>
            </tbody>
            <?php foreach ($stores as $store) { ?>
            <tbody>
              <tr>
                <td class="left"><?php echo $store['name']; ?></td>
                <td class="left"><select name="blog_layout[<?php echo $store['store_id']; ?>][layout_id]">
                    <option value=""></option>
                    <?php foreach ($layouts as $layout) { ?>
                    <?php if (isset($blog_layout[$store['store_id']]) && $blog_layout[$store['store_id']] == $layout['layout_id']) { ?>
                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select></td>
              </tr>
            </tbody>
            <?php } ?>
          </table>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('description<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});


CKEDITOR.replace('description1<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});

CKEDITOR.replace('description2<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});

CKEDITOR.replace('description3<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});

CKEDITOR.replace('description4<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});

CKEDITOR.replace('description5<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});

CKEDITOR.replace('description6<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});

CKEDITOR.replace('description7<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});

CKEDITOR.replace('description8<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});

CKEDITOR.replace('description9<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});

CKEDITOR.replace('description0<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});

CKEDITOR.replace('description11<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});

CKEDITOR.replace('description12<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});

CKEDITOR.replace('description13<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});

CKEDITOR.replace('description14<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});

CKEDITOR.replace('description15<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});


<?php } ?>
//--></script> 
<script type="text/javascript"><!--
$('input[name=\'path\']').autocomplete({
	delay: 500,
	source: function(request, response) {		
		$.ajax({
			url: 'index.php?route=catalog/blog/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					'blog_id':  0,
					'name':  '<?php echo $text_none; ?>'
				});
				
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.blog_id
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'path\']').val(ui.item.label);
		$('input[name=\'parent_id\']').val(ui.item.value);
		
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});
//--></script> 
<script type="text/javascript"><!--
// Filter
$('input[name=\'filter\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.filter_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#blog-filter' + ui.item.value).remove();
		
		$('#blog-filter').append('<div id="blog-filter' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="blog_filter[]" value="' + ui.item.value + '" /></div>');

		$('#blog-filter div:odd').attr('class', 'odd');
		$('#blog-filter div:even').attr('class', 'even');
				
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});

$('#blog-filter div img').live('click', function() {
	$(this).parent().remove();
	
	$('#blog-filter div:odd').attr('class', 'odd');
	$('#blog-filter div:even').attr('class', 'even');	
});
//--></script> 
<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
$('#languages a').tabs();
//--></script> 
<?php echo $footer; ?>
