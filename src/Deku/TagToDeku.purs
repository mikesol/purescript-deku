module Deku.TagToDeku where

import Deku.DOM.Tags as Tags

class TagToDeku (tag :: Symbol) (deku :: Type) | tag -> deku

instance tagToDekuTh_ :: TagToDeku "th" Tags.Th_
instance tagToDekuImage_ :: TagToDeku "image" Tags.Image_
instance tagToDekuFeOffset_ :: TagToDeku "feOffset" Tags.FeOffset_
instance tagToDekuForm_ :: TagToDeku "form" Tags.Form_
instance tagToDekuText_ :: TagToDeku "text" Tags.Text_
instance tagToDekuStop_ :: TagToDeku "stop" Tags.Stop_
instance tagToDekuRp_ :: TagToDeku "rp" Tags.Rp_
instance tagToDekuFeFuncR_ :: TagToDeku "feFuncR" Tags.FeFuncR_
instance tagToDekuThead_ :: TagToDeku "thead" Tags.Thead_
instance tagToDekuMap_ :: TagToDeku "map" Tags.Map_
instance tagToDekuFeFuncG_ :: TagToDeku "feFuncG" Tags.FeFuncG_
instance tagToDekuCite_ :: TagToDeku "cite" Tags.Cite_
instance tagToDekuDl_ :: TagToDeku "dl" Tags.Dl_
instance tagToDekuMark_ :: TagToDeku "mark" Tags.Mark_
instance tagToDekuTd_ :: TagToDeku "td" Tags.Td_
instance tagToDekuFrameset_ :: TagToDeku "frameset" Tags.Frameset_
instance tagToDekuMeta_ :: TagToDeku "meta" Tags.Meta_
instance tagToDekuMpath_ :: TagToDeku "mpath" Tags.Mpath_
instance tagToDekuB_ :: TagToDeku "b" Tags.B_
instance tagToDekuSelect_ :: TagToDeku "select" Tags.Select_
instance tagToDekuH4_ :: TagToDeku "h4" Tags.H4_
instance tagToDekuCenter_ :: TagToDeku "center" Tags.Center_
instance tagToDekuPolygon_ :: TagToDeku "polygon" Tags.Polygon_
instance tagToDekuLegend_ :: TagToDeku "legend" Tags.Legend_
instance tagToDekuIns_ :: TagToDeku "ins" Tags.Ins_
instance tagToDekuH5_ :: TagToDeku "h5" Tags.H5_
instance tagToDekuBase_ :: TagToDeku "base" Tags.Base_
instance tagToDekuPicture_ :: TagToDeku "picture" Tags.Picture_
instance tagToDekuFeSpotLight_ :: TagToDeku "feSpotLight" Tags.FeSpotLight_
instance tagToDekuTrack_ :: TagToDeku "track" Tags.Track_
instance tagToDekuAudio_ :: TagToDeku "audio" Tags.Audio_
instance tagToDekuKbd_ :: TagToDeku "kbd" Tags.Kbd_
instance tagToDekuHtml_ :: TagToDeku "html" Tags.Html_
instance tagToDekuDt_ :: TagToDeku "dt" Tags.Dt_
instance tagToDekuDatalist_ :: TagToDeku "datalist" Tags.Datalist_
instance tagToDekuLink_ :: TagToDeku "link" Tags.Link_
instance tagToDekuPre_ :: TagToDeku "pre" Tags.Pre_
instance tagToDekuLabel_ :: TagToDeku "label" Tags.Label_
instance tagToDekuTextPath_ :: TagToDeku "textPath" Tags.TextPath_
instance tagToDekuStrong_ :: TagToDeku "strong" Tags.Strong_
instance tagToDekuFigure_ :: TagToDeku "figure" Tags.Figure_
instance tagToDekuOptgroup_ :: TagToDeku "optgroup" Tags.Optgroup_
instance tagToDekuQ_ :: TagToDeku "q" Tags.Q_
instance tagToDekuBr_ :: TagToDeku "br" Tags.Br_
instance tagToDekuTable_ :: TagToDeku "table" Tags.Table_
instance tagToDekuMask_ :: TagToDeku "mask" Tags.Mask_
instance tagToDekuOption_ :: TagToDeku "option" Tags.Option_
instance tagToDekuEllipse_ :: TagToDeku "ellipse" Tags.Ellipse_
instance tagToDekuFeMorphology_ :: TagToDeku "feMorphology" Tags.FeMorphology_
instance tagToDekuNoscript_ :: TagToDeku "noscript" Tags.Noscript_
instance tagToDekuFeImage_ :: TagToDeku "feImage" Tags.FeImage_
instance tagToDekuH2_ :: TagToDeku "h2" Tags.H2_
instance tagToDekuArticle_ :: TagToDeku "article" Tags.Article_
instance tagToDekuBody_ :: TagToDeku "body" Tags.Body_
instance tagToDekuFeDisplacementMap_ ::
  TagToDeku "feDisplacementMap" Tags.FeDisplacementMap_

instance tagToDekuTextarea_ :: TagToDeku "textarea" Tags.Textarea_
instance tagToDekuPattern_ :: TagToDeku "pattern" Tags.Pattern_
instance tagToDekuIframe_ :: TagToDeku "iframe" Tags.Iframe_
instance tagToDekuTspan_ :: TagToDeku "tspan" Tags.Tspan_
instance tagToDekuFeFuncA_ :: TagToDeku "feFuncA" Tags.FeFuncA_
instance tagToDekuVideo_ :: TagToDeku "video" Tags.Video_
instance tagToDekuFrame_ :: TagToDeku "frame" Tags.Frame_
instance tagToDekuImg_ :: TagToDeku "img" Tags.Img_
instance tagToDekuFeDiffuseLighting_ ::
  TagToDeku "feDiffuseLighting" Tags.FeDiffuseLighting_

instance tagToDekuProgress_ :: TagToDeku "progress" Tags.Progress_
instance tagToDekuTitle_ :: TagToDeku "title" Tags.Title_
instance tagToDekuClipPath_ :: TagToDeku "clipPath" Tags.ClipPath_
instance tagToDekuSvg_ :: TagToDeku "svg" Tags.Svg_
instance tagToDekuI_ :: TagToDeku "i" Tags.I_
instance tagToDekuCol_ :: TagToDeku "col" Tags.Col_
instance tagToDekuDialog_ :: TagToDeku "dialog" Tags.Dialog_
instance tagToDekuFeConvolveMatrix_ ::
  TagToDeku "feConvolveMatrix" Tags.FeConvolveMatrix_

instance tagToDekuAddress_ :: TagToDeku "address" Tags.Address_
instance tagToDekuVar_ :: TagToDeku "var" Tags.Var_
instance tagToDekuFeGaussianBlur_ ::
  TagToDeku "feGaussianBlur" Tags.FeGaussianBlur_

instance tagToDekuObject_ :: TagToDeku "object" Tags.Object_
instance tagToDekuDiv_ :: TagToDeku "div" Tags.Div_
instance tagToDekuFont_ :: TagToDeku "font" Tags.Font_
instance tagToDekuFePointLight_ :: TagToDeku "fePointLight" Tags.FePointLight_
instance tagToDekuH3_ :: TagToDeku "h3" Tags.H3_
instance tagToDekuTime_ :: TagToDeku "time" Tags.Time_
instance tagToDekuFeSpecularLighting_ ::
  TagToDeku "feSpecularLighting" Tags.FeSpecularLighting_

instance tagToDekuLi_ :: TagToDeku "li" Tags.Li_
instance tagToDekuFeMerge_ :: TagToDeku "feMerge" Tags.FeMerge_
instance tagToDekuFeFlood_ :: TagToDeku "feFlood" Tags.FeFlood_
instance tagToDekuEm_ :: TagToDeku "em" Tags.Em_
instance tagToDekuDel_ :: TagToDeku "del" Tags.Del_
instance tagToDekuP_ :: TagToDeku "p" Tags.P_
instance tagToDekuDetails_ :: TagToDeku "details" Tags.Details_
instance tagToDekuButton_ :: TagToDeku "button" Tags.Button_
instance tagToDekuMetadata_ :: TagToDeku "metadata" Tags.Metadata_
instance tagToDekuFeMergeNode_ :: TagToDeku "feMergeNode" Tags.FeMergeNode_
instance tagToDekuStyle_ :: TagToDeku "style" Tags.Style_
instance tagToDekuBdo_ :: TagToDeku "bdo" Tags.Bdo_
instance tagToDekuFeDropShadow_ :: TagToDeku "feDropShadow" Tags.FeDropShadow_
instance tagToDekuArea_ :: TagToDeku "area" Tags.Area_
instance tagToDekuSub_ :: TagToDeku "sub" Tags.Sub_
instance tagToDekuFigcaption_ :: TagToDeku "figcaption" Tags.Figcaption_
instance tagToDekuFeDistantLight_ ::
  TagToDeku "feDistantLight" Tags.FeDistantLight_

instance tagToDekuCircle_ :: TagToDeku "circle" Tags.Circle_
instance tagToDekuSamp_ :: TagToDeku "samp" Tags.Samp_
instance tagToDekuS_ :: TagToDeku "s" Tags.S_
instance tagToDekuApplet_ :: TagToDeku "applet" Tags.Applet_
instance tagToDekuFeComposite_ :: TagToDeku "feComposite" Tags.FeComposite_
instance tagToDekuUse_ :: TagToDeku "use" Tags.Use_
instance tagToDekuRt_ :: TagToDeku "rt" Tags.Rt_
instance tagToDekuOl_ :: TagToDeku "ol" Tags.Ol_
instance tagToDekuTfoot_ :: TagToDeku "tfoot" Tags.Tfoot_
instance tagToDekuHr_ :: TagToDeku "hr" Tags.Hr_
instance tagToDekuDd_ :: TagToDeku "dd" Tags.Dd_
instance tagToDekuHead_ :: TagToDeku "head" Tags.Head_
instance tagToDekuBlockquote_ :: TagToDeku "blockquote" Tags.Blockquote_
instance tagToDekuSection_ :: TagToDeku "section" Tags.Section_
instance tagToDekuBig_ :: TagToDeku "big" Tags.Big_
instance tagToDekuFeFuncB_ :: TagToDeku "feFuncB" Tags.FeFuncB_
instance tagToDekuRadialGradient_ ::
  TagToDeku "radialGradient" Tags.RadialGradient_

instance tagToDekuInput_ :: TagToDeku "input" Tags.Input_
instance tagToDekuFeBlend_ :: TagToDeku "feBlend" Tags.FeBlend_
instance tagToDekuFeComponentTransfer_ ::
  TagToDeku "feComponentTransfer" Tags.FeComponentTransfer_

instance tagToDekuRect_ :: TagToDeku "rect" Tags.Rect_
instance tagToDekuRuby_ :: TagToDeku "ruby" Tags.Ruby_
instance tagToDekuDesc_ :: TagToDeku "desc" Tags.Desc_
instance tagToDekuMain_ :: TagToDeku "main" Tags.Main_
instance tagToDekuXdata_ :: TagToDeku "xdata" Tags.Xdata_
instance tagToDekuView_ :: TagToDeku "view" Tags.View_
instance tagToDekuWbr_ :: TagToDeku "wbr" Tags.Wbr_
instance tagToDekuSymbol_ :: TagToDeku "symbol" Tags.Symbol_
instance tagToDekuMeter_ :: TagToDeku "meter" Tags.Meter_
instance tagToDekuOutput_ :: TagToDeku "output" Tags.Output_
instance tagToDekuG_ :: TagToDeku "g" Tags.G_
instance tagToDekuH1_ :: TagToDeku "h1" Tags.H1_
instance tagToDekuTt_ :: TagToDeku "tt" Tags.Tt_
instance tagToDekuCaption_ :: TagToDeku "caption" Tags.Caption_
instance tagToDekuFieldset_ :: TagToDeku "fieldset" Tags.Fieldset_
instance tagToDekuAbbr_ :: TagToDeku "abbr" Tags.Abbr_
instance tagToDekuStrike_ :: TagToDeku "strike" Tags.Strike_
instance tagToDekuFeColorMatrix_ ::
  TagToDeku "feColorMatrix" Tags.FeColorMatrix_

instance tagToDekuScript_ :: TagToDeku "script" Tags.Script_
instance tagToDekuUl_ :: TagToDeku "ul" Tags.Ul_
instance tagToDekuAnimateMotion_ ::
  TagToDeku "animateMotion" Tags.AnimateMotion_

instance tagToDekuAnimate_ :: TagToDeku "animate" Tags.Animate_
instance tagToDekuMarker_ :: TagToDeku "marker" Tags.Marker_
instance tagToDekuH6_ :: TagToDeku "h6" Tags.H6_
instance tagToDekuBdi_ :: TagToDeku "bdi" Tags.Bdi_
instance tagToDekuParam_ :: TagToDeku "param" Tags.Param_
instance tagToDekuSmall_ :: TagToDeku "small" Tags.Small_
instance tagToDekuSource_ :: TagToDeku "source" Tags.Source_
instance tagToDekuColgroup_ :: TagToDeku "colgroup" Tags.Colgroup_
instance tagToDekuAnimateTransform_ ::
  TagToDeku "animateTransform" Tags.AnimateTransform_

instance tagToDekuTemplate_ :: TagToDeku "template" Tags.Template_
instance tagToDekuAcronym_ :: TagToDeku "acronym" Tags.Acronym_
instance tagToDekuFooter_ :: TagToDeku "footer" Tags.Footer_
instance tagToDekuCode_ :: TagToDeku "code" Tags.Code_
instance tagToDekuU_ :: TagToDeku "u" Tags.U_
instance tagToDekuLinearGradient_ ::
  TagToDeku "linearGradient" Tags.LinearGradient_

instance tagToDekuPolyline_ :: TagToDeku "polyline" Tags.Polyline_
instance tagToDekuLine_ :: TagToDeku "line" Tags.Line_
instance tagToDekuPath_ :: TagToDeku "path" Tags.Path_
instance tagToDekuSwitch_ :: TagToDeku "switch" Tags.Switch_
instance tagToDekuFilter_ :: TagToDeku "filter" Tags.Filter_
instance tagToDekuSup_ :: TagToDeku "sup" Tags.Sup_
instance tagToDekuSummary_ :: TagToDeku "summary" Tags.Summary_
instance tagToDekuDiscard_ :: TagToDeku "discard" Tags.Discard_
instance tagToDekuA_ :: TagToDeku "a" Tags.A_
instance tagToDekuForeignObject_ ::
  TagToDeku "foreignObject" Tags.ForeignObject_

instance tagToDekuTr_ :: TagToDeku "tr" Tags.Tr_
instance tagToDekuFeTile_ :: TagToDeku "feTile" Tags.FeTile_
instance tagToDekuDir_ :: TagToDeku "dir" Tags.Dir_
instance tagToDekuAside_ :: TagToDeku "aside" Tags.Aside_
instance tagToDekuNav_ :: TagToDeku "nav" Tags.Nav_
instance tagToDekuTbody_ :: TagToDeku "tbody" Tags.Tbody_
instance tagToDekuHeader_ :: TagToDeku "header" Tags.Header_
instance tagToDekuBasefont_ :: TagToDeku "basefont" Tags.Basefont_
instance tagToDekuSet_ :: TagToDeku "set" Tags.Set_
instance tagToDekuDfn_ :: TagToDeku "dfn" Tags.Dfn_
instance tagToDekuFeTurbulence_ :: TagToDeku "feTurbulence" Tags.FeTurbulence_
instance tagToDekuEmbed_ :: TagToDeku "embed" Tags.Embed_
instance tagToDekuNoframes_ :: TagToDeku "noframes" Tags.Noframes_
instance tagToDekuSpan_ :: TagToDeku "span" Tags.Span_
instance tagToDekuCanvas_ :: TagToDeku "canvas" Tags.Canvas_
instance tagToDekuDefs_ :: TagToDeku "defs" Tags.Defs_