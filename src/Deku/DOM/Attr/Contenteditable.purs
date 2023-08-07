module Deku.DOM.Attr.Contenteditable where


import Prelude

import FRP.Event as Event
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

data Contenteditable = Contenteditable

instance Attr A_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr A_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Abbr_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Abbr_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Acronym_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Acronym_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Address_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Address_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Applet_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Applet_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Area_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Area_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Article_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Article_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Aside_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Aside_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Audio_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Audio_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr B_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr B_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Base_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Base_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Basefont_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Basefont_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Bdi_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Bdi_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Bdo_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Bdo_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Big_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Big_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Blockquote_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Blockquote_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Body_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Body_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Br_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Br_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Button_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Button_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Canvas_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Canvas_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Caption_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Caption_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Center_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Center_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Cite_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Cite_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Code_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Code_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Col_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Col_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Colgroup_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Colgroup_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Xdata_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Xdata_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Datalist_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Datalist_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Dd_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Dd_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Del_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Del_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Details_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Details_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Dfn_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Dfn_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Dialog_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Dialog_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Dir_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Dir_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Div_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Div_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Dl_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Dl_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Dt_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Dt_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Em_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Em_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Embed_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Embed_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Fieldset_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Fieldset_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Figcaption_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Figcaption_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Figure_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Figure_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Font_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Font_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Footer_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Footer_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Form_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Form_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Frame_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Frame_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Frameset_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Frameset_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr H1_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr H1_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr H2_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr H2_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr H3_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr H3_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr H4_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr H4_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr H5_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr H5_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr H6_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr H6_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Head_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Head_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Header_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Header_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Hr_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Hr_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Html_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Html_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr I_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr I_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Iframe_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Iframe_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Img_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Img_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Input_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Input_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Ins_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Ins_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Kbd_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Kbd_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Label_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Label_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Legend_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Legend_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Li_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Li_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Link_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Link_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Main_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Main_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Map_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Map_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Mark_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Mark_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Meta_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Meta_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Meter_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Meter_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Nav_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Nav_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Noframes_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Noframes_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Noscript_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Noscript_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Object_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Object_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Ol_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Ol_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Optgroup_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Optgroup_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Option_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Option_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Output_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Output_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr P_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr P_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Param_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Param_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Picture_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Picture_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Pre_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Pre_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Progress_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Progress_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Q_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Q_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Rp_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Rp_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Rt_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Rt_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Ruby_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Ruby_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr S_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr S_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Samp_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Samp_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Script_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Script_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Section_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Section_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Select_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Select_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Small_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Small_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Source_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Source_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Span_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Span_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Strike_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Strike_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Strong_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Strong_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Style_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Style_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Sub_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Sub_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Summary_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Summary_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Sup_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Sup_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Svg_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Svg_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Table_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Table_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Tbody_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Tbody_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Td_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Td_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Template_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Template_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Textarea_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Textarea_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Tfoot_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Tfoot_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Th_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Th_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Thead_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Thead_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Time_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Time_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Title_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Title_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Tr_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Tr_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Track_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Track_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Tt_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Tt_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr U_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr U_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Ul_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Ul_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Var_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Var_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Video_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Video_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr Wbr_ Contenteditable  String  where
  attr Contenteditable value = unsafeAttribute (  
    { key: "contenteditable", value: prop' value  } <$ _)
instance Attr Wbr_ Contenteditable (Event.Event  String ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contenteditable", value: prop' value }


instance Attr everything Contenteditable  Unit  where
  attr Contenteditable _ = unsafeAttribute (  
    { key: "contenteditable", value: unset'  } <$ _)
instance Attr everything Contenteditable (Event.Event  Unit ) where
  attr Contenteditable eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "contenteditable", value: unset' }
