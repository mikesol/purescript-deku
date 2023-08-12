module Deku.DOM.Attr.Draggable where

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

data Draggable = Draggable

instance Attr A_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Abbr_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Acronym_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Address_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Applet_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Area_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Article_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Aside_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Audio_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr B_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Base_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Basefont_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Bdi_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Bdo_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Big_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Blockquote_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Body_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Br_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Button_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Canvas_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Caption_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Center_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Cite_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Code_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Col_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Colgroup_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Xdata_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Datalist_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Dd_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Del_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Details_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Dfn_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Dialog_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Dir_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Div_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Dl_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Dt_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Em_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Embed_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Fieldset_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Figcaption_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Figure_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Font_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Footer_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Form_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Frame_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Frameset_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr H1_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr H2_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr H3_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr H4_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr H5_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr H6_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Head_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Header_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Hr_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Html_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr I_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Iframe_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Img_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Input_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Ins_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Kbd_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Label_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Legend_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Li_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Link_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Main_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Map_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Mark_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Meta_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Meter_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Nav_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Noframes_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Noscript_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Object_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Ol_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Optgroup_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Option_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Output_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr P_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Param_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Picture_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Pre_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Progress_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Q_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Rp_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Rt_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Ruby_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr S_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Samp_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Script_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Section_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Select_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Small_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Source_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Span_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Strike_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Strong_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Style_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Sub_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Summary_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Sup_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Svg_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Table_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Tbody_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Td_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Template_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Textarea_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Tfoot_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Th_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Thead_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Time_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Title_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Tr_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Track_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Tt_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr U_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Ul_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Var_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Video_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr Wbr_ Draggable String where
  attr Draggable value = unsafeAttribute
    { key: "draggable", value: prop' value }

instance Attr everything Draggable Unit where
  attr Draggable _ = unsafeAttribute
    { key: "draggable", value: unset' }
