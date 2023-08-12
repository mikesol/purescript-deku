module Deku.DOM.Attr.Style where

import Prelude

import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Title (Title_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Stop (Stop_)
import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Path (Path_)
import Deku.DOM.Elt.Mask (Mask_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.G (G_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.DOM.Elt.FeTile (FeTile_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.DOM.Elt.FeMerge (FeMerge_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeFlood (FeFlood_)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Desc (Desc_)
import Deku.DOM.Elt.Defs (Defs_)
import Deku.DOM.Elt.ClipPath (ClipPath_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Abbr (Abbr_)
import Deku.DOM.Elt.Acronym (Acronym_)
import Deku.DOM.Elt.Address (Address_)
import Deku.DOM.Elt.Applet (Applet_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Article (Article_)
import Deku.DOM.Elt.Aside (Aside_)
import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.B (B_)
import Deku.DOM.Elt.Base (Base_)
import Deku.DOM.Elt.Basefont (Basefont_)
import Deku.DOM.Elt.Bdi (Bdi_)
import Deku.DOM.Elt.Bdo (Bdo_)
import Deku.DOM.Elt.Big (Big_)
import Deku.DOM.Elt.Blockquote (Blockquote_)
import Deku.DOM.Elt.Body (Body_)
import Deku.DOM.Elt.Br (Br_)
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Canvas (Canvas_)
import Deku.DOM.Elt.Caption (Caption_)
import Deku.DOM.Elt.Center (Center_)
import Deku.DOM.Elt.Cite (Cite_)
import Deku.DOM.Elt.Code (Code_)
import Deku.DOM.Elt.Col (Col_)
import Deku.DOM.Elt.Colgroup (Colgroup_)
import Deku.DOM.Elt.Xdata (Xdata_)
import Deku.DOM.Elt.Datalist (Datalist_)
import Deku.DOM.Elt.Dd (Dd_)
import Deku.DOM.Elt.Del (Del_)
import Deku.DOM.Elt.Details (Details_)
import Deku.DOM.Elt.Dfn (Dfn_)
import Deku.DOM.Elt.Dialog (Dialog_)
import Deku.DOM.Elt.Dir (Dir_)
import Deku.DOM.Elt.Div (Div_)
import Deku.DOM.Elt.Dl (Dl_)
import Deku.DOM.Elt.Dt (Dt_)
import Deku.DOM.Elt.Em (Em_)
import Deku.DOM.Elt.Embed (Embed_)
import Deku.DOM.Elt.Fieldset (Fieldset_)
import Deku.DOM.Elt.Figcaption (Figcaption_)
import Deku.DOM.Elt.Figure (Figure_)
import Deku.DOM.Elt.Font (Font_)
import Deku.DOM.Elt.Footer (Footer_)
import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.Frame (Frame_)
import Deku.DOM.Elt.Frameset (Frameset_)
import Deku.DOM.Elt.H1 (H1_)
import Deku.DOM.Elt.H2 (H2_)
import Deku.DOM.Elt.H3 (H3_)
import Deku.DOM.Elt.H4 (H4_)
import Deku.DOM.Elt.H5 (H5_)
import Deku.DOM.Elt.H6 (H6_)
import Deku.DOM.Elt.Head (Head_)
import Deku.DOM.Elt.Header (Header_)
import Deku.DOM.Elt.Hr (Hr_)
import Deku.DOM.Elt.Html (Html_)
import Deku.DOM.Elt.I (I_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Ins (Ins_)
import Deku.DOM.Elt.Kbd (Kbd_)
import Deku.DOM.Elt.Label (Label_)
import Deku.DOM.Elt.Legend (Legend_)
import Deku.DOM.Elt.Li (Li_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Main (Main_)
import Deku.DOM.Elt.Map (Map_)
import Deku.DOM.Elt.Mark (Mark_)
import Deku.DOM.Elt.Meta (Meta_)
import Deku.DOM.Elt.Meter (Meter_)
import Deku.DOM.Elt.Nav (Nav_)
import Deku.DOM.Elt.Noframes (Noframes_)
import Deku.DOM.Elt.Noscript (Noscript_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Ol (Ol_)
import Deku.DOM.Elt.Optgroup (Optgroup_)
import Deku.DOM.Elt.Option (Option_)
import Deku.DOM.Elt.Output (Output_)
import Deku.DOM.Elt.P (P_)
import Deku.DOM.Elt.Param (Param_)
import Deku.DOM.Elt.Picture (Picture_)
import Deku.DOM.Elt.Pre (Pre_)
import Deku.DOM.Elt.Progress (Progress_)
import Deku.DOM.Elt.Q (Q_)
import Deku.DOM.Elt.Rp (Rp_)
import Deku.DOM.Elt.Rt (Rt_)
import Deku.DOM.Elt.Ruby (Ruby_)
import Deku.DOM.Elt.S (S_)
import Deku.DOM.Elt.Samp (Samp_)
import Deku.DOM.Elt.Script (Script_)
import Deku.DOM.Elt.Section (Section_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Small (Small_)
import Deku.DOM.Elt.Source (Source_)
import Deku.DOM.Elt.Span (Span_)
import Deku.DOM.Elt.Strike (Strike_)
import Deku.DOM.Elt.Strong (Strong_)
import Deku.DOM.Elt.Style (Style_)
import Deku.DOM.Elt.Sub (Sub_)
import Deku.DOM.Elt.Summary (Summary_)
import Deku.DOM.Elt.Sup (Sup_)
import Deku.DOM.Elt.Table (Table_)
import Deku.DOM.Elt.Tbody (Tbody_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Template (Template_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.DOM.Elt.Tfoot (Tfoot_)
import Deku.DOM.Elt.Th (Th_)
import Deku.DOM.Elt.Thead (Thead_)
import Deku.DOM.Elt.Time (Time_)
import Deku.DOM.Elt.Tr (Tr_)
import Deku.DOM.Elt.Track (Track_)
import Deku.DOM.Elt.Tt (Tt_)
import Deku.DOM.Elt.U (U_)
import Deku.DOM.Elt.Ul (Ul_)
import Deku.DOM.Elt.Var (Var_)
import Deku.DOM.Elt.Video (Video_)
import Deku.DOM.Elt.Wbr (Wbr_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Style = Style

instance Attr A_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Abbr_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Acronym_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Address_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Applet_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Area_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Article_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Aside_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Audio_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr B_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Base_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Basefont_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Bdi_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Bdo_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Big_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Blockquote_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Body_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Br_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Button_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Canvas_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Caption_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Center_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Cite_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Code_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Col_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Colgroup_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Xdata_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Datalist_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Dd_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Del_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Details_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Dfn_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Dialog_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Dir_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Div_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Dl_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Dt_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Em_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Embed_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Fieldset_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Figcaption_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Figure_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Font_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Footer_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Form_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Frame_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Frameset_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr H1_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr H2_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr H3_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr H4_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr H5_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr H6_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Head_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Header_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Hr_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Html_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr I_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Iframe_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Img_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Input_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Ins_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Kbd_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Label_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Legend_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Li_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Link_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Main_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Map_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Mark_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Meta_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Meter_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Nav_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Noframes_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Noscript_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Object_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Ol_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Optgroup_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Option_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Output_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr P_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Param_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Picture_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Pre_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Progress_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Q_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Rp_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Rt_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Ruby_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr S_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Samp_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Script_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Section_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Select_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Small_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Source_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Span_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Strike_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Strong_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Style_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Sub_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Summary_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Sup_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Svg_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Table_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Tbody_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Td_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Template_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Textarea_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Tfoot_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Th_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Thead_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Time_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Title_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Tr_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Track_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Tt_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr U_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Ul_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Var_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Video_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Wbr_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Animate_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr AnimateMotion_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Circle_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr ClipPath_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Defs_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Desc_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Ellipse_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr FeBlend_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr FeColorMatrix_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr FeComponentTransfer_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr FeComposite_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr FeConvolveMatrix_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr FeDiffuseLighting_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr FeDisplacementMap_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr FeDropShadow_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr FeFlood_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr FeGaussianBlur_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr FeImage_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr FeMerge_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr FeMorphology_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr FeOffset_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr FeSpecularLighting_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr FeTile_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr FeTurbulence_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Filter_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr ForeignObject_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr G_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Image_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Line_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr LinearGradient_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Marker_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Mask_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Path_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Pattern_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Polygon_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Polyline_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr RadialGradient_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Rect_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Set_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Stop_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Switch_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Symbol_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Text_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr TextPath_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Tspan_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr Use_ Style String where
  attr Style value = unsafeAttribute { key: "style", value: prop' value }

instance Attr everything Style Unit where
  attr Style _ = unsafeAttribute
    { key: "style", value: unset' }
