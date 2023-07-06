module Deku.DOM.Attr.Title where

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

data Title = Title

instance Attr A_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Abbr_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Acronym_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Address_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Applet_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Area_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Article_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Aside_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Audio_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr B_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Base_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Basefont_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Bdi_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Bdo_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Big_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Blockquote_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Body_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Br_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Button_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Canvas_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Caption_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Center_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Cite_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Code_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Col_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Colgroup_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Xdata_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Datalist_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Dd_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Del_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Details_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Dfn_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Dialog_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Dir_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Div_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Dl_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Dt_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Em_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Embed_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Fieldset_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Figcaption_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Figure_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Font_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Footer_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Form_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Frame_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Frameset_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr H1_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr H2_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr H3_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr H4_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr H5_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr H6_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Head_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Header_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Hr_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Html_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr I_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Iframe_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Img_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Input_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Ins_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Kbd_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Label_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Legend_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Li_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Link_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Main_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Map_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Mark_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Meta_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Meter_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Nav_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Noframes_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Noscript_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Object_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Ol_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Optgroup_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Option_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Output_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr P_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Param_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Picture_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Pre_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Progress_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Q_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Rp_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Rt_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Ruby_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr S_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Samp_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Script_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Section_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Select_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Small_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Source_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Span_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Strike_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Strong_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Style_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Sub_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Summary_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Sup_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Svg_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Table_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Tbody_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Td_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Template_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Textarea_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Tfoot_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Th_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Thead_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Time_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Title_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Tr_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Track_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Tt_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr U_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Ul_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Var_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Video_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr Wbr_ Title String where
  attr Title value = unsafeAttribute { key: "title", value: prop' value }

instance Attr everything Title Unit where
  attr Title _ = unsafeAttribute
    { key: "title", value: unset' }
