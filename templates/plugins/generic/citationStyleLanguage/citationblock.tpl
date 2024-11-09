{if $citation}
    <div class="panel panel-default how-to-cite">
        <div class="panel-heading">
            <h2 class="panel-title">
                {translate key="submission.howToCite"}
            </h2>
        </div>
        <div class="panel-body">
            <div id="citationOutput" role="region" aria-live="polite">
                {$citation}
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    {translate key="submission.howToCite.citationFormats"}
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    {foreach from=$citationStyles item="citationStyle"}
                        <li>
                            <a
                                    rel="nofollow"
                                    aria-controls="citationOutput"
                                    href="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgs}"
                                    data-load-citation
                                    data-json-href="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgsJson}"
                            >
                                {$citationStyle.title|escape}
                            </a>
                        </li>
                    {/foreach}
                </ul>
            </div>
            {if count($citationDownloads)}
                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        {translate key="submission.howToCite.downloadCitation"}
                        <span class="caret"></span>
                    </button>
                    {* Download citation formats *}
                    <ul class="dropdown-menu" role="menu">
                        {foreach from=$citationDownloads item="citationDownload"}
                        <li>
                            <a href="{url page="citationstylelanguage" op="download" path=$citationDownload.id params=$citationArgs}">
                                <span class="fa fa-download"></span>
                                {$citationDownload.title|escape}
                            </a>
                        </li>
                        {/foreach}
                    </ul>
                </div>
            {/if}
        </div>
    </div>
{/if}
