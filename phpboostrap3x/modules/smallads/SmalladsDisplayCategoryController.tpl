<section id="smallads-module">
	<header class="page-header">
		# IF C_CATEGORY #
			<div class="pull-right text-right">
				<div class="btn-group btn-group-xs">
					# IF IS_ADMIN #
					<a class="btn btn-info" href="{U_EDIT_CATEGORY}" title="${LangLoader::get_message('edit', 'common')}">
						<i class="fa fa-edit"></i>
					</a>
					# ENDIF #
					<a class="btn btn-warning" href="${relative_url(SyndicationUrlBuilder::rss('smallads', ID_CATEGORY))}" title="${LangLoader::get_message('syndication', 'common')}"><i class="fa fa-syndication"></i> </a>
				</div>
			</div>
		# ENDIF #
		<h1>
			# IF C_PENDING #{@smallads.pending.items}# ELSE #{@smallads.module.title}# IF NOT C_ROOT_CATEGORY # - {CATEGORY_NAME}# ENDIF ## ENDIF #
		</h1>
		# IF C_CATEGORY_DESCRIPTION #
			<div class="cat-description">
				# IF NOT C_ROOT_CATEGORY #
					# IF C_DISPLAY_CAT_ICONS #
						# IF C_CATEGORY_IMAGE #
							<img class="thumbnail-item" itemprop="thumbnailUrl" src="{CATEGORY_IMAGE}" alt="{CATEGORY_NAME}" />
						# ENDIF #
					# ENDIF #
				# ENDIF #
				{CATEGORY_DESCRIPTION}
			</div>
		# ENDIF #
	</header>

	# IF C_TYPES_FILTERS #
		<div class="jplist-panel">

			<div class="row grid-columns">
				<!-- Categories -->
				# IF C_CATEGORY #
					<div class="category-select # IF C_PENDING #col-sm-12 col-md-6# ELSE ## IF C_MEMBER #col-sm-12 col-md-6# ELSE ## IF C_TAG #col-sm-12 col-md-6# ELSE ## IF C_CATEGORY #col-sm-6 col-md-4# ELSE #col-sm-12 col-md-6# ENDIF ## ENDIF ## ENDIF ## ENDIF #">
						<h6><p>{@smallads.category.select} :</p></h6>
						<div class="category-selected">{CATEGORY_NAME} <i class="fa fa-fw fa-caret-down"></i></div>
						<nav id="category-nav" class="cssmenu cssmenu-static bg-container">
							<ul>
								<li cat_id="0" parent_id="0" c_order="0">
									<a class="cssmenu-title" href="{PATH_TO_ROOT}/smallads">{@smallads.all.types.filters}</a>
								</li>
								# START categories #
									<li cat_id="{categories.ID}" parent_id="{categories.ID_PARENT}" c_order="{categories.SUB_ORDER}">
										<a class="cssmenu-title" href="{categories.U_CATEGORY}">{categories.NAME}</a>
									</li>
								# END categories #
							</ul>
						</nav>

					</div>
				# ENDIF #

				<!-- Types filter -->
				<div class="jplist-type-filter # IF C_PENDING #col-sm-12 col-md-6# ELSE ## IF C_MEMBER #col-sm-12 col-md-6# ELSE ## IF C_TAG #col-sm-12 col-md-6# ELSE ## IF C_CATEGORY #col-sm-6 col-md-4# ELSE #col-sm-12 col-md-6# ENDIF ## ENDIF ## ENDIF ## ENDIF #">
					<h6><p>{@smallads.form.smallads.types} :</p></h6>
					<div class="type-filter-radio">
						<div class="selected-label">
							<span>{@smallads.all.types.filters}</span> <i class="fa fa-fw fa-caret-down"></i>
						</div>
						<div class="label-list bg-container">
							<label class="jplist-label" for="default-radio">
								<input
								   data-control-type="radio-buttons-filters"
								   data-control-action="filter"
								   data-control-name="default"
								   data-path="default"
								   id="default-radio"
								   type="radio"
								   name="jplist"
								   checked="checked"
								/>	{@smallads.all.types.filters}
							</label>
							# START types #
								<label class="jplist-label" for="{types.TYPE_NAME_FILTER}">
									<input
										data-control-type="radio-buttons-filters"
										data-control-action="filter"
										data-control-name="{types.TYPE_NAME_FILTER}"
										data-path=".{types.TYPE_NAME_FILTER}"
										id="{types.TYPE_NAME_FILTER}"
										type="radio"
										name="jplist"
									/>	{types.TYPE_NAME}
								</label>
							# END types #
						</div>
					</div>
				</div>

				<!-- sort dropdown -->
				<div class="sort-list # IF C_PENDING #col-sm-12 col-md-6# ELSE ## IF C_MEMBER #col-sm-12 col-md-6# ELSE ## IF C_TAG #col-sm-12 col-md-6# ELSE ## IF C_CATEGORY #col-sm-6 col-md-4# ELSE #col-sm-12 col-md-6# ENDIF ## ENDIF ## ENDIF ## ENDIF #">
					<h6><p>{@smallads.sort.by} :</p></h6>
					<div
						class="jplist-drop-down"
						data-control-type="sort-drop-down"
						data-control-name="sort"
						data-control-action="sort">
						<ul class="bg-container">
							<li><span data-path=".jp-date" data-order="asc" data-type="number">{@smallads.sort.date} <em class="sort-type">&#8593;</em></span></li>
							<li><span data-path=".jp-date" data-order="desc" data-type="number" data-default="true">{@smallads.sort.date} <em class="sort-type">&#8595;</em></span></li>
							<li><span data-path=".jp-title" data-order="asc" data-type="text">{@smallads.sort.title} <em class="sort-type">&#8593;</em></span></li>
							<li><span data-path=".jp-title" data-order="desc" data-type="text">{@smallads.sort.title} <em class="sort-type">&#8595;</em></span></li>
							<li><span data-path=".jp-price" data-order="asc" data-type="number">{@smallads.sort.price} <em class="sort-type">&#8593;</em></span></li>
							<li><span data-path=".jp-price" data-order="desc" data-type="number">{@smallads.sort.price} <em class="sort-type">&#8595;</em></span></li>
		   # IF C_LOCATION #<li><span data-path=".jp-location" data-order="asc" data-type="text">{@location} <em class="sort-type">&#8593;</em></span></li>
				   		 	<li><span data-path=".jp-location" data-order="desc" data-type="text">{@location} <em class="sort-type">&#8595;</em></span></li># ENDIF #
		# IF NOT C_MEMBER #<li><span data-path=".jp-author" data-order="asc" data-type="text">{@smallads.sort.author} <em class="sort-type">&#8593;</em></span></li>
							<li><span data-path=".jp-author" data-order="desc" data-type="text">{@smallads.sort.author} <em class="sort-type">&#8595;</em></span></li># ENDIF #
		# IF NOT C_PENDING #<li><span data-path=".jp-comment" data-order="asc" data-type="number">{@smallads.sort.coms} <em class="sort-type">&#8593;</em></span></li>
							<li><span data-path=".jp-comment" data-order="desc" data-type="number">{@smallads.sort.coms} <em class="sort-type">&#8595;</em></span></li>
							<li><span data-path=".jp-view" data-order="asc" data-type="number">{@smallads.sort.view} <em class="sort-type">&#8593;</em></span></li>
							<li><span data-path=".jp-view" data-order="desc" data-type="number">{@smallads.sort.view} <em class="sort-type">&#8595;</em></span></li># ENDIF #
						</ul>
					</div>
				</div>
			</div>
		</div>
		<hr />
	# ENDIF #

	# IF C_NO_ITEM_AVAILABLE #
		# IF NOT C_HIDE_NO_ITEM_MESSAGE #
			<p class="alert alert-warning text-center">
				${LangLoader::get_message('no_item_now', 'common')}
			</p>
		# ENDIF #
	# ELSE #
		# IF C_TABLE #
			<div class="table-responsive">
				<table class="table list">
					<thead>
						<tr>
							<th class="smallads-title">${LangLoader::get_message('title', 'main')}</th>
							<th>{@smallads.form.price}</th>
							<th>{@smallads.ad.type}</th>
							<th>${LangLoader::get_message('author', 'common')}</th>
							# IF C_LOCATION #<th>{@location}</th># ENDIF #
							# IF C_CATEGORY #<th>${@smallads.category}</th># ENDIF #
							<th>${@smallads.publication.date}</th>
							# IF C_MODERATION #
								<th>${LangLoader::get_message('administrator_alerts_action', 'admin')}</th>
							# ENDIF #
						</tr>
					</thead>
					<tbody>
						# START items #
							<tr class="list-item# IF items.C_NEW_CONTENT # new-content# ENDIF ## IF items.C_COMPLETED # completed-smallad# ENDIF #">
								<td class="text-left">
									# IF NOT items.C_COMPLETED #<a itemprop="url" href="{items.U_ITEM}"># ENDIF #
										<span class="jp-title" itemprop="name">{items.TITLE}</span>
									# IF NOT items.C_COMPLETED #</a># ENDIF #
									<span class="jp-view hidden">{items.VIEWS_NUMBER}</span>
									<span class="jp-note hidden">{items.AVERAGE_NOTE}</span>
									<span class="jp-comment hidden">{items.COMMENTS_NUMBER}</span>
									<span class="jp-date hidden">{items.DATE_TIMESTAMP}</span>
								</td>
								<td class="jp-price"># IF items.C_COMPLETED #{@smallads.completed.item}# ELSE ## IF items.C_PRICE #{items.PRICE} {items.CURRENCY}# ENDIF ## ENDIF #</td>
								<td class="{items.SMALLAD_TYPE_FILTER}">{items.SMALLAD_TYPE}</td>
								# IF items.C_DISPLAYED_AUTHOR #
									<td class="jp-author">
										# IF items.C_CUSTOM_AUTHOR_NAME #
											{items.CUSTOM_AUTHOR_NAME}
										# ELSE #
											# IF items.C_AUTHOR_EXIST #<a itemprop="author" href="{items.U_AUTHOR}" class="{items.USER_LEVEL_CLASS}" # IF C_USER_GROUP_COLOR # style="color:{items.USER_GROUP_COLOR}"# ENDIF #>{items.PSEUDO}</a># ELSE #{items.PSEUDO}# ENDIF #
										# ENDIF #
									</td>
								# ENDIF #
								# IF C_LOCATION #
									<td class="jp-location">
										# IF items.IS_LOCATED #
											# IF items.C_GMAP #
												{items.LOCATION}
											# ELSE #
												# IF items.C_OTHER_LOCATION #
													{@other.country} : {items.OTHER_LOCATION}
												# ELSE #
													{items.LOCATION}
												# ENDIF #
											# ENDIF #
										# ENDIF #
									</td>
								# ENDIF #
								# IF C_CATEGORY #
								<td>
									<a itemprop="about" href="{items.U_CATEGORY}">{items.CATEGORY_NAME}</a>
								</td>
								# ENDIF #
								<td>
									<time datetime="# IF NOT items.C_DIFFERED #{items.DATE_ISO8601}# ELSE #{items.PUBLICATION_START_DATE_ISO8601}# ENDIF #" itemprop="datePublished"># IF NOT items.C_DIFFERED #{items.DATE_RELATIVE}# ELSE #{items.PUBLICATION_START_DATE_RELATIVE}# ENDIF #</time>
								</td>
								# IF C_MODERATION #
									<td>
										# IF NOT items.C_COMPLETED #
											# IF items.C_EDIT #
												<a href="{items.U_EDIT_ITEM}" title="${LangLoader::get_message('edit', 'common')}"><i class="fa fa-edit"></i></a>
											# ENDIF #
										# ENDIF #
											# IF items.C_DELETE #
												<a href="{items.U_DELETE_ITEM}" title="${LangLoader::get_message('delete', 'common')}" data-confirmation="delete-element"><i class="fa fa-delete"></i></a>
											# ENDIF #
									</td>
								# ENDIF #
							</tr>
						# END items #
					</tbody>
				</table>
			</div>


		# ELSE #
			# IF C_MOSAIC #
				<div class="list row grid-columns">
					# START items #
						<article id="smallads-items-{items.ID}" class="list-item col-sm-6 col-md-4# IF items.C_COMPLETED# completed-smallad# ENDIF ## IF items.C_NEW_CONTENT # new-content# ENDIF #" itemscope="itemscope" itemtype="http://schema.org/CreativeWork">

							<meta itemprop="url" content="{items.U_ITEM}">
							<meta itemprop="description" content="${escape(items.DESCRIPTION)}"/>
							<meta itemprop="discussionUrl" content="{items.U_COMMENTS}">
							<meta itemprop="interactionCount" content="{items.COMMENTS_NUMBER} UserComments">

							# IF items.C_COMPLETED # <div class="completed-item"><span>{@smallads.completed.item}</span></div># ENDIF #

							<p class="{items.SMALLAD_TYPE_FILTER}">{items.SMALLAD_TYPE}</p>
							# IF items.C_HAS_THUMBNAIL #
								<a href="{items.U_ITEM}" class="thumbnail-item">
									<img itemprop="thumbnailUrl" src="{items.THUMBNAIL}" alt="{items.TITLE}" />
								</a>
							# ELSE #
								<a href="{items.U_ITEM}" class="thumbnail-item">
									<img itemprop="thumbnailUrl" src="{PATH_TO_ROOT}/smallads/templates/images/no-thumb.png" alt="{items.TITLE}" />
								</a>
							# ENDIF #

							<div class="caption">
								<div class="pull-right text-right">
									<div class="btn-group btn-group-xs">
										# IF items.C_EDIT #
											<a class="btn btn-info" href="{items.U_EDIT_ITEM}" title="${LangLoader::get_message('edit', 'common')}"><i class="fa fa-edit"></i></a>
										# ENDIF #
										# IF items.C_DELETE #
											<a class="btn btn-danger" href="{items.U_DELETE_ITEM}" title="${LangLoader::get_message('delete', 'common')}" data-confirmation="delete-element"><i class="fa fa-delete"></i></a>
										# ENDIF #
									</div>
								</div>
								<h2>
									<a class="jp-title" itemprop="url" href="{items.U_ITEM}"><span itemprop="name">{items.TITLE}</span></a>
								</h2>

								<small>
									# IF items.C_DISPLAYED_AUTHOR #
										<span class="jp-author">
											${LangLoader::get_message('by', 'common')}
											# IF items.C_CUSTOM_AUTHOR_NAME #
												{items.CUSTOM_AUTHOR_NAME}
											# ELSE #
												# IF items.C_AUTHOR_EXIST #<a itemprop="author" href="{items.U_AUTHOR}" class="{items.USER_LEVEL_CLASS}" # IF C_USER_GROUP_COLOR # style="color:{items.USER_GROUP_COLOR}"# ENDIF #>{items.PSEUDO}</a># ELSE #{items.PSEUDO}# ENDIF #,
											# ENDIF #
										</span>
									# ENDIF #
									<span>
										${LangLoader::get_message('the', 'common')} <time datetime="# IF NOT items.C_DIFFERED #{items.DATE_ISO8601}# ELSE #{items.PUBLICATION_START_DATE_ISO8601}# ENDIF #" itemprop="datePublished"># IF NOT items.C_DIFFERED #{items.DATE}# ELSE #{items.PUBLICATION_START_DATE}# ENDIF #</time>
									</span>
									<span>
										${TextHelper::lcfirst(LangLoader::get_message('in', 'common'))} <a itemprop="about" href="{items.U_CATEGORY}">{items.CATEGORY_NAME}</a>
									</span>
									# IF C_LOCATION #
										<span class="jp-location">
											# IF items.C_GMAP #
												# IF items.IS_LOCATED #
													, {@location} : {items.LOCATION}
												# ENDIF #
											# ELSE #
												# IF items.IS_LOCATED #
													# IF items.C_OTHER_LOCATION #
														, {@other.country} : {items.OTHER_LOCATION}
													# ELSE #
														, {@county} : {items.LOCATION}
													# ENDIF #
												# ENDIF #
											# ENDIF #
										</span>
									# ENDIF #
									<span class="jp-view hidden">{items.VIEWS_NUMBER}</span>
									<span class="jp-note hidden">{items.AVERAGE_NOTE}</span>
									<span class="jp-comment hidden">{items.COMMENTS_NUMBER}</span>
									<span class="jp-date hidden">{items.DATE_TIMESTAMP}</span>
								</small>


							</div>
							<p itemprop="text">{items.DESCRIPTION}</p>
							# IF items.C_READ_MORE #
								<a href="{items.U_ITEM}" class="btn btn-primary">
									${LangLoader::get_message('read-more', 'common')}
								</a>
							# ENDIF #
							<div class="smallad-price jp-price"># IF items.C_PRICE #{items.PRICE} {items.CURRENCY}# ENDIF #</div>

							# IF items.C_SOURCES #
							<div class="spacer"></div>
							<aside>
								<div id="smallads-sources-container">
									<span>${LangLoader::get_message('form.sources', 'common')}</span> :
									# START items.sources #
									<a itemprop="isBasedOnUrl" href="{items.sources.URL}" class="small">{items.sources.NAME}</a># IF items.sources.C_SEPARATOR #, # ENDIF #
									# END items.sources #
								</div>
							</aside>
							# ENDIF #

							<footer></footer>
						</article>
					# END items #
				</div>
			# ENDIF #
			# IF C_LIST #
				<div class="list row grid-columns">
					# START items #
						<article id="article-items-{items.ID}" class="list-item col-sm-12 mb15 # IF items.C_NEW_CONTENT # new-content# ENDIF #" itemscope="itemscope" itemtype="http://schema.org/CreativeWork">

							<meta itemprop="url" content="{items.U_ITEM}">
							<meta itemprop="description" content="${escape(items.DESCRIPTION)}"/>
							<meta itemprop="discussionUrl" content="{items.U_COMMENTS}">
							<meta itemprop="interactionCount" content="{items.NUMBER_COMMENTS} UserComments">

							# IF items.C_COMPLETED # <div class="completed-item"><span>{@smallads.completed.item}</span></div># ENDIF #

							<p class="{items.SMALLAD_TYPE_FILTER}">{items.SMALLAD_TYPE}</p>
							# IF items.C_HAS_THUMBNAIL #
								<div class="col-md-3">
									<a href="{items.U_ITEM}">
										<img src="{items.THUMBNAIL}" alt="{items.TITLE}" />
									</a>
								</div>
							# ELSE #
								<div class="col-md-3">
									<a href="{items.U_ITEM}" class="thumbnail-item">
										<img itemprop="thumbnailUrl" src="{PATH_TO_ROOT}/smallads/templates/images/no-thumb.png" alt="{items.TITLE}" />
									</a>
								</div>
							# ENDIF #
							<div class="col-md-9">
								<small class="pull-right text-right">
									# IF items.C_EDIT #
										<a href="{items.U_EDIT_ITEM}" title="${LangLoader::get_message('edit', 'common')}"><i class="fa fa-fw fa-edit"></i></a>
									# ENDIF #
									# IF items.C_DELETE #
										<a href="{items.U_DELETE_ITEM}" title="${LangLoader::get_message('delete', 'common')}" data-confirmation="delete-element"><i class="fa fa-fw fa-delete"></i></a>
									# ENDIF #
								</small>
								<h3>
									<a class="jp-title" itemprop="url" href="{items.U_ITEM}"><span itemprop="name">{items.TITLE}</span></a>
								</h3>
								<small>
									# IF items.C_AUTHOR_DISPLAYED #
										<span class="jp-author">
											${LangLoader::get_message('by', 'common')}
											# IF items.C_AUTHOR_CUSTOM_NAME #
												{items.AUTHOR_CUSTOM_NAME}
											# ELSE #
												# IF items.C_AUTHOR_EXIST #<a itemprop="author" href="{items.U_AUTHOR}" class="{items.USER_LEVEL_CLASS}" # IF C_USER_GROUP_COLOR # style="color:{items.USER_GROUP_COLOR}"# ENDIF #>{items.PSEUDO}</a># ELSE #{items.PSEUDO}# ENDIF #,
											# ENDIF #
										</span>
									# ENDIF #
									${LangLoader::get_message('the', 'common')} <time datetime="# IF NOT items.C_DIFFERED #{items.DATE_ISO8601}# ELSE #{items.PUBLISHING_START_DATE_ISO8601}# ENDIF #" itemprop="datePublished"># IF NOT items.C_DIFFERED #{items.DATE}# ELSE #{items.PUBLISHING_START_DATE}# ENDIF #</time>
									${TextHelper::lcfirst(LangLoader::get_message('in', 'common'))} <a itemprop="about" href="{items.U_CATEGORY}">{items.CATEGORY_NAME}</a>

									# IF C_LOCATION #
										<span class="jp-location">
											# IF items.C_GMAP #
												# IF items.IS_LOCATED #
													, {@location} : {items.LOCATION}
												# ENDIF #
											# ELSE #
												# IF items.IS_LOCATED #
													# IF items.C_OTHER_LOCATION #
														, {@other.country} : {items.OTHER_LOCATION}
													# ELSE #
														, {@county} : {items.LOCATION}
													# ENDIF #
												# ENDIF #
											# ENDIF #
										</span>
									# ENDIF #
									<span class="jp-view hidden">{items.VIEWS_NUMBER}</span>
									<span class="jp-note hidden">{items.AVERAGE_NOTE}</span>
									<span class="jp-comment hidden">{items.COMMENTS_NUMBER}</span>
									<span class="jp-date hidden">{items.DATE_TIMESTAMP}</span>
								</small>
								<p itemprop="text">{items.DESCRIPTION}# IF items.C_READ_MORE # ...# ENDIF #</p>
								<p class="pull-right">
									<a href="{items.U_ITEM}" class="btn btn-primary">${LangLoader::get_message('read-more', 'common')}</a>
								</p>
								<div class="pull-left smallad-price jp-price"># IF items.C_PRICE #{items.PRICE} {items.CURRENCY}# ENDIF #</div>
								<div class="clearfix"></div>
								# IF items.C_SOURCES #
								<p id="items-sources-container">
									${LangLoader::get_message('form.sources', 'common')} :
									# START items.sources #
									<a itemprop="isBasedOnUrl" href="{items.sources.URL}"><span class="badge">{items.sources.NAME}</span></a># IF items.sources.C_SEPARATOR # | # ENDIF #
									# END items.sources #
								</p>
								# ENDIF #
							</div>

							<footer></footer>
						</article>
					# END items #
				</div>
			# ENDIF #
		# ENDIF #
	# ENDIF #
		<div class="jplist-panel pull-right">

			<!-- Pagination -->
			<div class="pagination options no-style">
				<div
				   class="jplist-label"
				   data-type="{@smallads.pagination}"
				   data-control-type="pagination-info"
				   data-control-name="paging"
				   data-control-action="paging">
				</div>

				<div
				   class="jplist-pagination"
				   data-control-type="pagination"
				   data-control-name="paging"
				   data-control-action="paging"
				   data-items-per-page="{ITEMS_PER_PAGE}">
				</div>
			</div>
			<div class="spacer"></div>
		</div>

	<div class="spacer"></div>
	<footer># IF C_USAGE_TERMS # <i class="fa fa-book"></i> <a href="{U_USAGE_TERMS}">{@smallads.usage.terms}</a># ENDIF #</footer>
</section>

<!-- jpList -->
<script src="{PATH_TO_ROOT}/smallads/templates/js/jplist.core.min.js"></script>
<!-- Types filters radio -->
<script src="{PATH_TO_ROOT}/smallads/templates/js/jplist.filter-toggle-bundle.min.js"></script>
<!-- Pagination -->
<script src="{PATH_TO_ROOT}/smallads/templates/js/jplist.pagination-bundle.min.js"></script>
<!-- Sort order -->
<script src="{PATH_TO_ROOT}/smallads/templates/js/jplist.sort-bundle.min.js"></script>

<script>
	jQuery('document').ready(function(){
		// jpList
		jQuery('#smallads-module').jplist({
			itemsBox: '.list',
			itemPath: '.list-item',
			panelPath: '.jplist-panel'
		});

		// Type filters
			// toggle sub-menu on click (close on click outside)
		jQuery('.selected-label').click(function(e){
			jQuery('.label-list').toggleClass('reveal-list');
    		e.stopPropagation();
		});
		jQuery(document).click(function(e) {
		    if (jQuery(e.target).is('.selected-label') === false) {
		      jQuery('.label-list').removeClass('reveal-list');
		    }
		});
			// send label text of selected input to title on click
		$('.label-list input').click(function(e) {
		    var radioText = e.currentTarget.nextSibling.data;
		    $('.selected-label span').html(radioText);
		});

		// Categories
			// build order
		jQuery('#category-nav').append(CreatChild(0)).find('ul:first').remove();
		function CreatChild(id){
		    var $li = jQuery('li[parent_id=' + id + ']').sort(function(a, b){
				return jQuery(a).attr('c_order') - jQuery(b).attr('c_order');
			});
		    if($li.length > 0){
		        for(var i = 0; i < $li.length; i++){
		            var $this = $li.eq(i);
					$this[0].remove();
		            $this.append(CreatChild($this.attr('cat_id')));
		        }
		        return jQuery('<ul>').append($li);
		    }
		}

			// build cssmenu
		jQuery('li:not([cat_id=0])').has('ul').addClass('has-sub');

			// change root name
		jQuery('.category-selected:contains("${LangLoader::get_message('root', 'main')}")').html('{@smallads.category.all} <i class="fa fa-fw fa-caret-down"></i>');

			// toggle sub-menu (close on click outside)
		jQuery('.category-selected').click(function(e){
			jQuery('.category-select').toggleClass('reveal-subcat');
    		e.stopPropagation();
		});
		jQuery(document).click(function(e) {
		    if (jQuery(e.target).is('.category-selected') === false) {
		      jQuery('.category-select').removeClass('reveal-subcat');
		    }
		});
	});

</script>