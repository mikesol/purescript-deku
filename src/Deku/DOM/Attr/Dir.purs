module Deku.DOM.Attr.Dir where

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

data Dir = Dir

instance Attr A_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr A_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr A_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr A_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr A_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Abbr_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Abbr_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Abbr_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Abbr_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Abbr_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Acronym_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Acronym_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Acronym_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Acronym_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Acronym_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Address_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Address_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Address_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Address_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Address_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Applet_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Applet_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Applet_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Applet_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Applet_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Area_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Area_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Area_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Area_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Area_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Article_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Article_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Article_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Article_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Article_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Aside_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Aside_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Aside_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Aside_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Aside_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Audio_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Audio_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Audio_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Audio_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Audio_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr B_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr B_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr B_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr B_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr B_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Base_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Base_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Base_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Base_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Base_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Basefont_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Basefont_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Basefont_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Basefont_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Basefont_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Bdi_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Bdi_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Bdi_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Bdi_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Bdi_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Bdo_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Bdo_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Bdo_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Bdo_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Bdo_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Big_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Big_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Big_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Big_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Big_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Blockquote_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Blockquote_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Blockquote_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Blockquote_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Blockquote_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Body_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Body_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Body_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Body_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Body_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Br_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Br_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Br_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Br_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Br_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Button_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Button_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Button_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Button_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Button_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Canvas_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Canvas_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Canvas_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Canvas_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Canvas_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Caption_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Caption_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Caption_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Caption_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Caption_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Center_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Center_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Center_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Center_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Center_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Cite_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Cite_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Cite_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Cite_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Cite_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Code_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Code_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Code_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Code_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Code_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Col_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Col_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Col_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Col_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Col_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Colgroup_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Colgroup_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Colgroup_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Colgroup_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Colgroup_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Xdata_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Xdata_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Xdata_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Xdata_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Xdata_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Datalist_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Datalist_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Datalist_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Datalist_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Datalist_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Dd_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Dd_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Dd_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Dd_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Dd_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Del_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Del_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Del_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Del_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Del_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Details_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Details_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Details_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Details_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Details_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Dfn_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Dfn_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Dfn_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Dfn_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Dfn_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Dialog_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Dialog_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Dialog_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Dialog_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Dialog_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Dir_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Dir_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Dir_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Dir_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Dir_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Div_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Div_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Div_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Div_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Div_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Dl_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Dl_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Dl_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Dl_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Dl_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Dt_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Dt_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Dt_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Dt_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Dt_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Em_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Em_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Em_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Em_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Em_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Embed_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Embed_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Embed_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Embed_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Embed_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Fieldset_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Fieldset_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Fieldset_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Fieldset_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Fieldset_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Figcaption_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Figcaption_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Figcaption_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Figcaption_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Figcaption_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Figure_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Figure_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Figure_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Figure_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Figure_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Font_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Font_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Font_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Font_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Font_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Footer_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Footer_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Footer_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Footer_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Footer_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Form_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Form_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Form_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Form_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Form_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Frame_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Frame_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Frame_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Frame_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Frame_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Frameset_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Frameset_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Frameset_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Frameset_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Frameset_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr H1_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr H1_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr H1_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr H1_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr H1_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr H2_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr H2_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr H2_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr H2_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr H2_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr H3_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr H3_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr H3_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr H3_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr H3_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr H4_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr H4_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr H4_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr H4_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr H4_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr H5_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr H5_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr H5_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr H5_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr H5_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr H6_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr H6_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr H6_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr H6_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr H6_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Head_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Head_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Head_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Head_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Head_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Header_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Header_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Header_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Header_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Header_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Hr_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Hr_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Hr_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Hr_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Hr_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Html_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Html_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Html_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Html_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Html_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr I_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr I_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr I_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr I_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr I_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Iframe_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Iframe_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Iframe_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Iframe_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Iframe_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Img_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Img_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Img_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Img_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Img_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Input_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Input_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Input_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Input_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Input_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Ins_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Ins_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Ins_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Ins_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Ins_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Kbd_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Kbd_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Kbd_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Kbd_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Kbd_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Label_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Label_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Label_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Label_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Label_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Legend_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Legend_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Legend_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Legend_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Legend_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Li_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Li_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Li_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Li_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Li_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Link_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Link_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Link_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Link_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Link_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Main_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Main_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Main_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Main_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Main_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Map_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Map_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Map_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Map_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Map_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Mark_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Mark_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Mark_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Mark_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Mark_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Meta_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Meta_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Meta_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Meta_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Meta_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Meter_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Meter_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Meter_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Meter_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Meter_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Nav_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Nav_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Nav_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Nav_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Nav_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Noframes_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Noframes_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Noframes_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Noframes_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Noframes_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Noscript_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Noscript_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Noscript_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Noscript_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Noscript_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Object_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Object_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Object_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Object_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Object_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Ol_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Ol_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Ol_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Ol_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Ol_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Optgroup_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Optgroup_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Optgroup_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Optgroup_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Optgroup_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Option_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Option_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Option_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Option_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Option_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Output_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Output_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Output_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Output_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Output_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr P_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr P_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr P_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr P_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr P_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Param_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Param_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Param_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Param_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Param_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Picture_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Picture_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Picture_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Picture_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Picture_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Pre_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Pre_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Pre_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Pre_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Pre_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Progress_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Progress_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Progress_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Progress_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Progress_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Q_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Q_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Q_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Q_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Q_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Rp_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Rp_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Rp_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Rp_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Rp_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Rt_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Rt_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Rt_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Rt_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Rt_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Ruby_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Ruby_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Ruby_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Ruby_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Ruby_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr S_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr S_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr S_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr S_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr S_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Samp_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Samp_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Samp_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Samp_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Samp_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Script_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Script_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Script_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Script_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Script_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Section_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Section_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Section_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Section_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Section_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Select_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Select_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Select_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Select_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Select_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Small_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Small_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Small_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Small_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Small_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Source_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Source_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Source_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Source_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Source_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Span_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Span_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Span_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Span_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Span_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Strike_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Strike_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Strike_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Strike_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Strike_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Strong_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Strong_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Strong_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Strong_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Strong_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Style_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Style_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Style_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Style_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Style_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Sub_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Sub_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Sub_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Sub_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Sub_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Summary_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Summary_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Summary_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Summary_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Summary_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Sup_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Sup_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Sup_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Sup_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Sup_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Svg_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Svg_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Svg_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Svg_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Svg_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Table_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Table_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Table_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Table_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Table_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Tbody_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Tbody_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Tbody_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Tbody_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Tbody_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Td_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Td_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Td_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Td_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Td_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Template_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Template_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Template_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Template_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Template_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Textarea_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Textarea_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Textarea_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Textarea_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Textarea_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Tfoot_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Tfoot_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Tfoot_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Tfoot_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Tfoot_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Th_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Th_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Th_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Th_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Th_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Thead_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Thead_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Thead_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Thead_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Thead_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Time_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Time_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Time_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Time_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Time_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Title_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Title_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Title_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Title_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Title_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Tr_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Tr_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Tr_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Tr_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Tr_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Track_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Track_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Track_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Track_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Track_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Tt_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Tt_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Tt_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Tt_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Tt_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr U_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr U_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr U_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr U_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr U_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Ul_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Ul_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Ul_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Ul_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Ul_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Var_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Var_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Var_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Var_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Var_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Video_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Video_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Video_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Video_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Video_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr Wbr_ Dir (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure 
    { key: "dir", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Wbr_ Dir (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dir", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dir", value: prop' value })
instance Attr Wbr_ Dir  String  where
  attr Dir value = unsafeAttribute $ This $ { key: "dir", value: prop' value }
instance Attr Wbr_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dir", value: prop' value }

instance Attr Wbr_ Dir (ST.ST Global.Global  String ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "dir", value: prop' value }

instance Attr everything Dir (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Dir bothValues = unsafeAttribute $ Both (pure  { key: "dir", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "dir", value: unset' })
instance Attr everything Dir (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Dir (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "dir", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "dir", value: unset' })
instance Attr everything Dir  Unit  where
  attr Dir _ = unsafeAttribute $ This $ { key: "dir", value: unset' }
instance Attr everything Dir (Event.Event  Unit ) where
  attr Dir eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "dir", value: unset' }

instance Attr everything Dir (ST.ST Global.Global  Unit ) where
  attr Dir iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "dir", value: unset' }
