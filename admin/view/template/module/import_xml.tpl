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
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><span class="required">*</span> <?php echo $entry_file; ?></td>
            <td><input name="import_xml_file" type="file" value="<?php echo $import_xml_file; ?>" accept="application/xml" />
              <?php if ($error_file) { ?>
              <span class="error"><?php echo $error_file; ?></span>
              <?php } ?></td>
          </tr>
        </table>
          <div style="text-align: center;">
          <a onclick="$('#form').submit();" class="button"><?php echo $button_import; ?></a>
          </div>
      </form>
    </div>

  </div>
</div>
<?php echo $footer; ?>