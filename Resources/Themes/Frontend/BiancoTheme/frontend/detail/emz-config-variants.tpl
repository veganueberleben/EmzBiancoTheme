<form method="post" action="{url sArticle=$sArticle.articleID sCategory=$sArticle.categoryID}" class="configurator--form upprice--form">
    {foreach $sArticle.sConfigurator as $sConfigurator}

        <div class="emz-detail-product-variants">
            <div class="configurator--label">
                <div class="configurator--label-groupname">
                    <strong>{$sConfigurator.groupname}:</strong>
                </div>
                <div class="configurator--label-selected-value">
                    {foreach $sConfigurator.values as $configValue}
                        {if $configValue.selected}
                            {$configValue.optionname}
                        {/if}
                    {/foreach}
                </div>
            </div>
            <div class="configurator--select">
                {foreach $sConfigurator.values as $configValue}
                    {if !{config name=hideNoInstock} || ({config name=hideNoInstock} && $configValue.selectable)}
                        <input type="radio"
                                name="group[{$sConfigurator.groupID}]"
                                id="group[{$configValue.groupID}][{$configValue.optionID}]"
                                value="{$configValue.optionID}"
                                data-ajax-select-variants="true"
                                {if $configValue.selected && ($sArticle.notification || $configValue.selectable)}checked="checked"{/if}
                                style="display: none;"
                        />
                        <label for="group[{$configValue.groupID}][{$configValue.optionID}]" class="{if $configValue.selected} is--active{/if}{if $configValue.media} has--image{/if}">
                            {if $configValue.media}
                                {$media = $configValue.media}

                                {block name='frontend_detail_configurator_variant_group_option_label_image'}
                                    <span class="image--element">
                                        <span class="image--media">
                                            {if isset($media.thumbnails)}
                                                <img srcset="{$media.thumbnails[0].sourceSet}" alt="{$configValue.optionname}" />
                                            {else}
                                                <img src="{link file='frontend/_public/src/img/no-picture.jpg'}" alt="{$configValue.optionname}">
                                            {/if}
                                        </span>
                                        <span class="image--media-title">
                                            {$configValue.optionname}
                                        </span>
                                    </span>
                                {/block}
                            {else}
                                {block name='frontend_detail_configurator_variant_group_option_label_text'}
                                    <span class="image--element">
                                        <span class="image--media">

                                        </span>
                                        <span class="image--media-title">
                                            {$configValue.optionname}
                                        </span>
                                    </span>
                                {/block}
                            {/if}
                        </label>
                    {/if}
                {/foreach}
            </div>
        </div>
    {/foreach}

    {block name='frontend_detail_configurator_noscript_action'}
        <noscript>
            <input name="recalc" type="submit" value="{s name='DetailConfigActionSubmit'}{/s}" />
        </noscript>
    {/block}
</form>
