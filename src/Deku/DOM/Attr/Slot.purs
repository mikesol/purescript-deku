module Deku.DOM.Attr.Slot where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
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

data Slot = Slot

instance Attr A_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr A_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr A_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr A_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr A_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Abbr_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Abbr_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Abbr_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Abbr_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Abbr_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Acronym_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Acronym_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Acronym_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Acronym_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Acronym_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Address_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Address_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Address_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Address_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Address_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Applet_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Applet_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Applet_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Applet_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Applet_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Area_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Area_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Area_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Area_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Area_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Article_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Article_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Article_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Article_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Article_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Aside_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Aside_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Aside_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Aside_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Aside_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Audio_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Audio_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Audio_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Audio_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Audio_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr B_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr B_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr B_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr B_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr B_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Base_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Base_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Base_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Base_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Base_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Basefont_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Basefont_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Basefont_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Basefont_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Basefont_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Bdi_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Bdi_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Bdi_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Bdi_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Bdi_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Bdo_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Bdo_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Bdo_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Bdo_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Bdo_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Big_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Big_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Big_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Big_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Big_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Blockquote_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Blockquote_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Blockquote_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Blockquote_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Blockquote_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Body_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Body_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Body_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Body_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Body_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Br_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Br_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Br_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Br_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Br_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Button_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Button_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Button_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Button_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Button_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Canvas_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Canvas_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Canvas_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Canvas_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Canvas_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Caption_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Caption_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Caption_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Caption_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Caption_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Center_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Center_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Center_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Center_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Center_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Cite_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Cite_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Cite_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Cite_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Cite_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Code_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Code_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Code_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Code_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Code_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Col_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Col_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Col_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Col_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Col_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Colgroup_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Colgroup_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Colgroup_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Colgroup_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Colgroup_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Xdata_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Xdata_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Xdata_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Xdata_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Xdata_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Datalist_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Datalist_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Datalist_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Datalist_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Datalist_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Dd_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Dd_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Dd_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Dd_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Dd_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Del_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Del_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Del_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Del_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Del_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Details_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Details_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Details_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Details_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Details_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Dfn_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Dfn_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Dfn_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Dfn_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Dfn_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Dialog_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Dialog_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Dialog_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Dialog_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Dialog_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Dir_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Dir_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Dir_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Dir_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Dir_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Div_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Div_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Div_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Div_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Div_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Dl_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Dl_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Dl_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Dl_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Dl_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Dt_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Dt_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Dt_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Dt_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Dt_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Em_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Em_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Em_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Em_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Em_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Embed_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Embed_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Embed_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Embed_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Embed_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Fieldset_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Fieldset_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Fieldset_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Fieldset_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Fieldset_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Figcaption_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Figcaption_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Figcaption_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Figcaption_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Figcaption_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Figure_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Figure_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Figure_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Figure_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Figure_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Font_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Font_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Font_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Font_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Font_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Footer_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Footer_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Footer_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Footer_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Footer_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Form_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Form_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Form_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Form_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Form_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Frame_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Frame_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Frame_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Frame_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Frame_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Frameset_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Frameset_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Frameset_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Frameset_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Frameset_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr H1_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr H1_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr H1_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr H1_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr H1_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr H2_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr H2_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr H2_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr H2_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr H2_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr H3_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr H3_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr H3_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr H3_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr H3_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr H4_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr H4_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr H4_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr H4_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr H4_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr H5_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr H5_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr H5_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr H5_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr H5_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr H6_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr H6_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr H6_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr H6_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr H6_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Head_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Head_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Head_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Head_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Head_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Header_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Header_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Header_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Header_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Header_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Hr_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Hr_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Hr_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Hr_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Hr_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Html_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Html_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Html_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Html_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Html_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr I_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr I_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr I_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr I_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr I_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Iframe_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Iframe_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Iframe_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Iframe_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Iframe_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Img_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Img_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Img_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Img_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Img_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Input_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Input_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Input_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Input_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Input_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Ins_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Ins_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Ins_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Ins_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Ins_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Kbd_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Kbd_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Kbd_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Kbd_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Kbd_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Label_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Label_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Label_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Label_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Label_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Legend_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Legend_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Legend_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Legend_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Legend_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Li_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Li_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Li_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Li_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Li_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Link_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Link_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Link_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Link_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Link_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Main_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Main_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Main_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Main_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Main_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Map_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Map_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Map_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Map_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Map_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Mark_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Mark_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Mark_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Mark_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Mark_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Meta_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Meta_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Meta_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Meta_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Meta_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Meter_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Meter_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Meter_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Meter_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Meter_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Nav_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Nav_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Nav_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Nav_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Nav_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Noframes_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Noframes_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Noframes_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Noframes_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Noframes_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Noscript_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Noscript_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Noscript_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Noscript_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Noscript_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Object_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Object_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Object_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Object_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Object_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Ol_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Ol_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Ol_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Ol_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Ol_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Optgroup_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Optgroup_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Optgroup_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Optgroup_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Optgroup_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Option_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Option_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Option_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Option_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Option_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Output_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Output_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Output_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Output_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Output_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr P_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr P_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr P_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr P_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr P_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Param_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Param_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Param_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Param_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Param_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Picture_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Picture_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Picture_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Picture_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Picture_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Pre_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Pre_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Pre_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Pre_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Pre_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Progress_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Progress_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Progress_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Progress_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Progress_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Q_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Q_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Q_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Q_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Q_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Rp_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Rp_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Rp_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Rp_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Rp_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Rt_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Rt_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Rt_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Rt_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Rt_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Ruby_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Ruby_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Ruby_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Ruby_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Ruby_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr S_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr S_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr S_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr S_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr S_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Samp_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Samp_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Samp_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Samp_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Samp_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Script_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Script_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Script_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Script_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Script_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Section_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Section_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Section_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Section_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Section_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Select_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Select_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Select_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Select_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Select_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Small_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Small_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Small_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Small_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Small_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Source_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Source_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Source_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Source_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Source_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Span_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Span_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Span_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Span_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Span_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Strike_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Strike_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Strike_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Strike_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Strike_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Strong_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Strong_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Strong_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Strong_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Strong_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Style_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Style_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Style_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Style_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Style_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Sub_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Sub_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Sub_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Sub_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Sub_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Summary_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Summary_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Summary_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Summary_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Summary_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Sup_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Sup_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Sup_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Sup_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Sup_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Svg_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Svg_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Svg_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Svg_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Svg_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Table_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Table_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Table_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Table_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Table_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Tbody_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Tbody_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Tbody_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Tbody_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Tbody_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Td_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Td_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Td_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Td_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Td_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Template_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Template_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Template_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Template_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Template_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Textarea_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Textarea_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Textarea_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Textarea_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Textarea_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Tfoot_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Tfoot_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Tfoot_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Tfoot_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Tfoot_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Th_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Th_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Th_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Th_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Th_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Thead_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Thead_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Thead_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Thead_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Thead_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Time_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Time_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Time_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Time_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Time_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Title_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Title_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Title_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Title_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Title_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Tr_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Tr_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Tr_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Tr_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Tr_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Track_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Track_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Track_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Track_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Track_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Tt_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Tt_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Tt_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Tt_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Tt_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr U_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr U_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr U_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr U_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr U_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Ul_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Ul_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Ul_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Ul_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Ul_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Var_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Var_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Var_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Var_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Var_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Video_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Video_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Video_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Video_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Video_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Wbr_ Slot (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure 
    { key: "slot", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Wbr_ Slot (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "slot", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "slot", value: prop' value })
instance Attr Wbr_ Slot  String  where
  attr Slot value = unsafeAttribute $ This $ pure $
    { key: "slot", value: prop' value }
instance Attr Wbr_ Slot (Event.Event  String ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr Wbr_ Slot (ST.ST Global.Global  String ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "slot", value: prop' value }

instance Attr everything Slot (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Slot bothValues = unsafeAttribute $ Both (pure  { key: "slot", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "slot", value: unset' })
instance Attr everything Slot (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Slot (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "slot", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "slot", value: unset' })
instance Attr everything Slot  Unit  where
  attr Slot _ = unsafeAttribute $ This $ pure $ { key: "slot", value: unset' }
instance Attr everything Slot (Event.Event  Unit ) where
  attr Slot eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "slot", value: unset' }

instance Attr everything Slot (ST.ST Global.Global  Unit ) where
  attr Slot stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "slot", value: unset' }
