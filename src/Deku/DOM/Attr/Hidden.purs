module Deku.DOM.Attr.Hidden where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

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

data Hidden = Hidden

instance Attr A_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr A_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr A_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Abbr_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Abbr_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Abbr_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Acronym_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Acronym_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Acronym_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Address_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Address_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Address_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Applet_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Applet_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Applet_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Area_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Area_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Area_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Article_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Article_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Article_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Aside_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Aside_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Aside_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Audio_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Audio_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Audio_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr B_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr B_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr B_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Base_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Base_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Base_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Basefont_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Basefont_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Basefont_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Bdi_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Bdi_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Bdi_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Bdo_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Bdo_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Bdo_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Big_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Big_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Big_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Blockquote_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Blockquote_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Blockquote_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Body_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Body_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Body_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Br_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Br_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Br_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Button_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Button_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Button_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Canvas_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Canvas_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Canvas_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Caption_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Caption_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Caption_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Center_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Center_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Center_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Cite_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Cite_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Cite_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Code_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Code_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Code_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Col_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Col_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Col_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Colgroup_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Colgroup_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Colgroup_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Xdata_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Xdata_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Xdata_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Datalist_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Datalist_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Datalist_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Dd_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Dd_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Dd_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Del_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Del_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Del_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Details_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Details_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Details_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Dfn_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Dfn_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Dfn_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Dialog_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Dialog_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Dialog_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Dir_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Dir_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Dir_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Div_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Div_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Div_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Dl_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Dl_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Dl_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Dt_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Dt_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Dt_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Em_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Em_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Em_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Embed_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Embed_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Embed_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Fieldset_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Fieldset_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Fieldset_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Figcaption_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Figcaption_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Figcaption_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Figure_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Figure_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Figure_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Font_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Font_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Font_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Footer_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Footer_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Footer_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Form_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Form_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Form_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Frame_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Frame_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Frame_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Frameset_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Frameset_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Frameset_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr H1_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr H1_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr H1_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr H2_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr H2_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr H2_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr H3_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr H3_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr H3_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr H4_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr H4_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr H4_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr H5_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr H5_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr H5_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr H6_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr H6_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr H6_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Head_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Head_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Head_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Header_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Header_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Header_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Hr_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Hr_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Hr_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Html_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Html_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Html_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr I_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr I_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr I_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Iframe_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Iframe_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Iframe_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Img_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Img_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Img_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Input_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Input_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Input_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Ins_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Ins_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Ins_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Kbd_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Kbd_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Kbd_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Label_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Label_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Label_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Legend_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Legend_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Legend_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Li_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Li_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Li_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Link_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Link_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Link_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Main_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Main_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Main_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Map_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Map_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Map_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Mark_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Mark_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Mark_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Meta_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Meta_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Meta_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Meter_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Meter_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Meter_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Nav_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Nav_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Nav_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Noframes_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Noframes_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Noframes_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Noscript_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Noscript_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Noscript_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Object_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Object_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Object_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Ol_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Ol_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Ol_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Optgroup_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Optgroup_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Optgroup_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Option_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Option_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Option_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Output_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Output_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Output_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr P_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr P_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr P_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Param_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Param_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Param_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Picture_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Picture_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Picture_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Pre_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Pre_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Pre_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Progress_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Progress_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Progress_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Q_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Q_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Q_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Rp_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Rp_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Rp_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Rt_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Rt_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Rt_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Ruby_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Ruby_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Ruby_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr S_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr S_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr S_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Samp_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Samp_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Samp_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Script_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Script_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Script_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Section_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Section_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Section_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Select_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Select_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Select_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Small_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Small_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Small_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Source_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Source_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Source_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Span_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Span_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Span_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Strike_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Strike_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Strike_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Strong_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Strong_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Strong_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Style_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Style_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Style_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Sub_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Sub_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Sub_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Summary_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Summary_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Summary_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Sup_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Sup_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Sup_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Svg_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Svg_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Svg_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Table_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Table_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Table_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Tbody_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Tbody_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Tbody_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Td_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Td_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Td_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Template_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Template_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Template_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Textarea_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Textarea_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Textarea_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Tfoot_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Tfoot_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Tfoot_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Th_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Th_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Th_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Thead_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Thead_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Thead_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Time_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Time_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Time_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Title_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Title_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Title_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Tr_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Tr_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Tr_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Track_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Track_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Track_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Tt_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Tt_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Tt_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr U_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr U_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr U_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Ul_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Ul_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Ul_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Var_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Var_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Var_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Video_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Video_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Video_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr Wbr_ Hidden (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hidden", value: prop' value })
instance Attr Wbr_ Hidden  String  where
  attr Hidden value = unsafeAttribute $ This $ pure $
    { key: "hidden", value: prop' value }
instance Attr Wbr_ Hidden (Event.Event  String ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hidden", value: prop' value }

instance Attr everything Hidden (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Hidden bothValues = unsafeAttribute $ Both
    { key: "hidden", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "hidden", value: unset' })
instance Attr everything Hidden  Unit  where
  attr Hidden _ = unsafeAttribute $ This $ pure $ { key: "hidden", value: unset' }
instance Attr everything Hidden (Event.Event  Unit ) where
  attr Hidden eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "hidden", value: unset' }
