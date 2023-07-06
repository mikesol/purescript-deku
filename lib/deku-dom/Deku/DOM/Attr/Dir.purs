module Deku.DOM.Attr.Dir where

import Prelude

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
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Table (Table_)
import Deku.DOM.Elt.Tbody (Tbody_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Template (Template_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.DOM.Elt.Tfoot (Tfoot_)
import Deku.DOM.Elt.Th (Th_)
import Deku.DOM.Elt.Thead (Thead_)
import Deku.DOM.Elt.Time (Time_)
import Deku.DOM.Elt.Title (Title_)
import Deku.DOM.Elt.Tr (Tr_)
import Deku.DOM.Elt.Track (Track_)
import Deku.DOM.Elt.Tt (Tt_)
import Deku.DOM.Elt.U (U_)
import Deku.DOM.Elt.Ul (Ul_)
import Deku.DOM.Elt.Var (Var_)
import Deku.DOM.Elt.Video (Video_)
import Deku.DOM.Elt.Wbr (Wbr_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Dir = Dir

instance Attr A_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Abbr_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Acronym_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Address_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Applet_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Area_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Article_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Aside_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Audio_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr B_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Base_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Basefont_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Bdi_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Bdo_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Big_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Blockquote_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Body_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Br_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Button_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Canvas_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Caption_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Center_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Cite_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Code_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Col_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Colgroup_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Xdata_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Datalist_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Dd_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Del_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Details_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Dfn_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Dialog_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Dir_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Div_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Dl_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Dt_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Em_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Embed_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Fieldset_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Figcaption_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Figure_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Font_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Footer_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Form_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Frame_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Frameset_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr H1_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr H2_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr H3_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr H4_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr H5_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr H6_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Head_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Header_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Hr_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Html_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr I_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Iframe_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Img_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Input_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Ins_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Kbd_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Label_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Legend_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Li_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Link_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Main_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Map_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Mark_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Meta_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Meter_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Nav_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Noframes_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Noscript_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Object_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Ol_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Optgroup_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Option_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Output_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr P_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Param_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Picture_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Pre_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Progress_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Q_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Rp_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Rt_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Ruby_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr S_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Samp_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Script_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Section_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Select_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Small_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Source_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Span_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Strike_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Strong_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Style_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Sub_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Summary_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Sup_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Svg_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Table_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Tbody_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Td_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Template_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Textarea_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Tfoot_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Th_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Thead_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Time_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Title_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Tr_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Track_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Tt_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr U_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Ul_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Var_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Video_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr Wbr_ Dir String where
  attr Dir value = unsafeAttribute { key: "dir", value: prop' value }

instance Attr everything Dir Unit where
  attr Dir _ = unsafeAttribute
    { key: "dir", value: unset' }
