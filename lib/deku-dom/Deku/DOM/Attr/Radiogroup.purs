module Deku.DOM.Attr.Radiogroup where

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

data Radiogroup = Radiogroup

instance Attr A_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Abbr_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Acronym_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Address_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Applet_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Area_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Article_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Aside_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Audio_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr B_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Base_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Basefont_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Bdi_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Bdo_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Big_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Blockquote_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Body_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Br_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Button_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Canvas_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Caption_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Center_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Cite_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Code_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Col_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Colgroup_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Xdata_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Datalist_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Dd_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Del_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Details_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Dfn_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Dialog_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Dir_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Div_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Dl_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Dt_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Em_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Embed_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Fieldset_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Figcaption_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Figure_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Font_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Footer_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Form_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Frame_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Frameset_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr H1_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr H2_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr H3_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr H4_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr H5_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr H6_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Head_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Header_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Hr_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Html_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr I_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Iframe_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Img_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Input_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Ins_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Kbd_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Label_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Legend_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Li_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Link_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Main_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Map_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Mark_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Meta_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Meter_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Nav_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Noframes_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Noscript_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Object_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Ol_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Optgroup_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Option_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Output_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr P_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Param_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Picture_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Pre_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Progress_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Q_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Rp_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Rt_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Ruby_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr S_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Samp_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Script_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Section_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Select_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Small_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Source_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Span_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Strike_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Strong_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Style_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Sub_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Summary_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Sup_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Svg_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Table_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Tbody_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Td_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Template_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Textarea_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Tfoot_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Th_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Thead_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Time_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Title_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Tr_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Track_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Tt_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr U_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Ul_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Var_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Video_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr Wbr_ Radiogroup String where
  attr Radiogroup value = unsafeAttribute
    { key: "radiogroup", value: prop' value }

instance Attr everything Radiogroup Unit where
  attr Radiogroup _ = unsafeAttribute
    { key: "radiogroup", value: unset' }
