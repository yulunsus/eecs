(function(){$(document).on("ready page:load",function(){var t;return $(document).on("focus","input.datepicker:not(.hasDatepicker)",function(){var t,e,n;return t=$(this),"date"!==t[0].type?(e={dateFormat:"yy-mm-dd"},n=t.data("datepicker-options"),t.datepicker($.extend(e,n))):void 0}),$(".clear_filters_btn").click(function(){var t,e,n;return e=window.location.search.split("&"),n=/^(q\[|q%5B|q%5b|page|commit)/,window.location.search=function(){var i,o,r;for(r=[],i=0,o=e.length;o>i;i++)t=e[i],t.match(n)||r.push(t);return r}().join("&")}),$(".filter_form").submit(function(){return $(this).find(":input").filter(function(){return""===this.value}).prop("disabled",!0)}),$(".filter_form_field.select_and_search select").change(function(){return $(this).siblings("input").prop({name:"q["+this.value+"]"})}),$("#active_admin_content .tabs").tabs(),(t=$(".table_tools .batch_actions_selector")).length?t.next().css({width:"calc(100% - 10px - "+t.outerWidth()+"px)","float":"right"}):void 0})}).call(this);