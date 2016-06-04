{assign var="advancedSearch" value=$advancedSearch|default:false}
{assign var="cuv" value=$cuv|default:''}
{assign var="text" value=$text|default:false}


<section class="row search">
  <div class="col-md-12">
    <form action="{$wwwRoot}search.php" name="frm" onsubmit="return searchSubmit()" id="searchForm">
      <div class="row">
        <div class="col-md-12">
          <div class="input-group">
            {if !$advancedSearch}
              <span class="input-group-btn">
                <button type="button" title="căutare avansată"
                        class="btn btn-primary" onclick="return toggle('advSearch')">
                  <span class="glyphicon glyphicon-menu-hamburger"></span>
                </button>
              </span>
            {/if}
            <input type="text" class="form-control searchField" name="cuv" placeholder="cuvânt" value="{$cuv|escape}" maxlength="50"/>
            <span class="input-group-btn">
              <button type="submit" value="caută" id="searchButton" class="btn btn-primary">
                  <span class="glyphicon glyphicon-search"></span>
                caută
              </button>
            </span>
          </div>
        </div>
      </div>

      <div class="row" id="advSearch" {if !$advancedSearch}style="display: none"{/if}>
        <div class="col-md-12 form-inline">
          <div class="checkbox">
            <label>
              <input type="checkbox" name="text" value="1" id="defBody" {if $text}checked="checked"{/if}/>
              Caută în tot textul definițiilor
            </label>
          </div>
          {include file="bits/sourceDropDown.tpl" urlName=1}
          <a id="advSearchHelp" href="http://wiki.dexonline.ro/wiki/Ajutor_pentru_căutare" target="_blank">ajutor</a>
        </div>
      </div>
    </form>
    <script>
     {if $cfg.search.acEnable}
     searchInit(true, {$cfg.search.acMinChars});
     {else}
     searchInit(false);
     {/if}
    </script>
  </div>
</section>
