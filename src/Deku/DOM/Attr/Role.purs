module Deku.DOM.Attr.Role where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.View (View_)
import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Path (Path_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.G (G_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Circle (Circle_)
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

data Role = Role

instance Attr A_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr A_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr A_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr A_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr A_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Abbr_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Abbr_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Abbr_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Abbr_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Abbr_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Acronym_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Acronym_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Acronym_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Acronym_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Acronym_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Address_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Address_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Address_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Address_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Address_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Applet_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Applet_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Applet_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Applet_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Applet_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Area_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Area_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Area_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Area_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Area_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Article_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Article_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Article_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Article_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Article_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Aside_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Aside_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Aside_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Aside_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Aside_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Audio_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Audio_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Audio_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Audio_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Audio_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr B_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr B_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr B_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr B_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr B_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Base_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Base_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Base_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Base_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Base_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Basefont_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Basefont_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Basefont_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Basefont_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Basefont_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Bdi_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Bdi_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Bdi_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Bdi_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Bdi_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Bdo_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Bdo_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Bdo_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Bdo_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Bdo_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Big_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Big_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Big_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Big_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Big_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Blockquote_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Blockquote_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Blockquote_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Blockquote_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Blockquote_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Body_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Body_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Body_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Body_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Body_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Br_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Br_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Br_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Br_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Br_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Button_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Button_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Button_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Button_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Button_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Canvas_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Canvas_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Canvas_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Canvas_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Canvas_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Caption_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Caption_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Caption_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Caption_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Caption_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Center_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Center_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Center_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Center_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Center_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Cite_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Cite_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Cite_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Cite_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Cite_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Code_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Code_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Code_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Code_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Code_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Col_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Col_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Col_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Col_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Col_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Colgroup_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Colgroup_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Colgroup_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Colgroup_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Colgroup_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Xdata_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Xdata_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Xdata_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Xdata_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Xdata_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Datalist_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Datalist_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Datalist_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Datalist_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Datalist_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Dd_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Dd_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Dd_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Dd_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Dd_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Del_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Del_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Del_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Del_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Del_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Details_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Details_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Details_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Details_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Details_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Dfn_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Dfn_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Dfn_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Dfn_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Dfn_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Dialog_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Dialog_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Dialog_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Dialog_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Dialog_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Dir_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Dir_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Dir_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Dir_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Dir_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Div_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Div_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Div_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Div_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Div_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Dl_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Dl_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Dl_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Dl_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Dl_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Dt_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Dt_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Dt_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Dt_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Dt_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Em_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Em_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Em_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Em_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Em_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Embed_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Embed_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Embed_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Embed_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Embed_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Fieldset_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Fieldset_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Fieldset_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Fieldset_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Fieldset_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Figcaption_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Figcaption_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Figcaption_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Figcaption_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Figcaption_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Figure_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Figure_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Figure_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Figure_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Figure_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Font_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Font_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Font_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Font_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Font_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Footer_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Footer_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Footer_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Footer_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Footer_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Form_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Form_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Form_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Form_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Form_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Frame_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Frame_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Frame_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Frame_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Frame_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Frameset_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Frameset_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Frameset_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Frameset_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Frameset_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr H1_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr H1_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr H1_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr H1_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr H1_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr H2_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr H2_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr H2_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr H2_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr H2_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr H3_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr H3_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr H3_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr H3_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr H3_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr H4_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr H4_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr H4_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr H4_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr H4_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr H5_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr H5_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr H5_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr H5_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr H5_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr H6_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr H6_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr H6_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr H6_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr H6_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Head_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Head_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Head_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Head_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Head_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Header_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Header_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Header_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Header_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Header_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Hr_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Hr_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Hr_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Hr_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Hr_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Html_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Html_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Html_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Html_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Html_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr I_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr I_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr I_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr I_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr I_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Iframe_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Iframe_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Iframe_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Iframe_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Iframe_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Img_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Img_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Img_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Img_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Img_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Input_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Input_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Input_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Input_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Input_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Ins_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Ins_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Ins_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Ins_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Ins_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Kbd_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Kbd_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Kbd_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Kbd_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Kbd_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Label_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Label_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Label_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Label_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Label_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Legend_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Legend_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Legend_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Legend_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Legend_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Li_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Li_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Li_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Li_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Li_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Link_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Link_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Link_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Link_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Link_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Main_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Main_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Main_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Main_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Main_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Map_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Map_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Map_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Map_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Map_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Mark_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Mark_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Mark_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Mark_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Mark_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Meta_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Meta_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Meta_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Meta_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Meta_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Meter_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Meter_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Meter_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Meter_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Meter_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Nav_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Nav_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Nav_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Nav_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Nav_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Noframes_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Noframes_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Noframes_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Noframes_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Noframes_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Noscript_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Noscript_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Noscript_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Noscript_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Noscript_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Object_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Object_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Object_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Object_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Object_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Ol_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Ol_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Ol_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Ol_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Ol_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Optgroup_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Optgroup_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Optgroup_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Optgroup_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Optgroup_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Option_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Option_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Option_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Option_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Option_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Output_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Output_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Output_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Output_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Output_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr P_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr P_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr P_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr P_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr P_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Param_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Param_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Param_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Param_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Param_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Picture_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Picture_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Picture_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Picture_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Picture_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Pre_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Pre_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Pre_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Pre_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Pre_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Progress_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Progress_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Progress_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Progress_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Progress_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Q_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Q_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Q_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Q_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Q_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Rp_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Rp_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Rp_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Rp_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Rp_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Rt_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Rt_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Rt_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Rt_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Rt_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Ruby_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Ruby_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Ruby_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Ruby_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Ruby_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr S_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr S_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr S_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr S_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr S_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Samp_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Samp_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Samp_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Samp_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Samp_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Script_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Script_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Script_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Script_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Script_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Section_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Section_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Section_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Section_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Section_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Select_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Select_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Select_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Select_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Select_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Small_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Small_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Small_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Small_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Small_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Source_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Source_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Source_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Source_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Source_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Span_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Span_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Span_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Span_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Span_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Strike_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Strike_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Strike_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Strike_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Strike_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Strong_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Strong_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Strong_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Strong_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Strong_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Style_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Style_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Style_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Style_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Style_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Sub_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Sub_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Sub_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Sub_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Sub_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Summary_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Summary_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Summary_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Summary_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Summary_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Sup_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Sup_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Sup_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Sup_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Sup_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Svg_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Svg_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Svg_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Svg_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Svg_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Table_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Table_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Table_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Table_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Table_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Tbody_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Tbody_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Tbody_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Tbody_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Tbody_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Td_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Td_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Td_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Td_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Td_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Template_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Template_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Template_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Template_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Template_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Textarea_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Textarea_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Textarea_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Textarea_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Textarea_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Tfoot_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Tfoot_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Tfoot_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Tfoot_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Tfoot_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Th_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Th_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Th_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Th_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Th_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Thead_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Thead_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Thead_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Thead_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Thead_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Time_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Time_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Time_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Time_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Time_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Title_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Title_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Title_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Title_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Title_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Tr_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Tr_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Tr_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Tr_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Tr_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Track_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Track_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Track_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Track_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Track_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Tt_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Tt_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Tt_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Tt_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Tt_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr U_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr U_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr U_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr U_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr U_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Ul_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Ul_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Ul_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Ul_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Ul_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Var_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Var_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Var_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Var_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Var_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Video_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Video_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Video_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Video_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Video_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Wbr_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Wbr_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Wbr_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Wbr_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Wbr_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Circle_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Circle_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Circle_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Circle_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Circle_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Ellipse_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Ellipse_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Ellipse_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Ellipse_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Ellipse_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr ForeignObject_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr ForeignObject_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr ForeignObject_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr ForeignObject_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr ForeignObject_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr G_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr G_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr G_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr G_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr G_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Line_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Line_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Line_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Line_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Line_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Marker_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Marker_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Marker_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Marker_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Marker_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Path_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Path_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Path_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Path_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Path_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Polygon_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Polygon_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Polygon_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Polygon_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Polygon_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Polyline_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Polyline_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Polyline_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Polyline_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Polyline_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Rect_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Rect_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Rect_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Rect_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Rect_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Symbol_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Symbol_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Symbol_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Symbol_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Symbol_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Text_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Text_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Text_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Text_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Text_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr TextPath_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr TextPath_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr TextPath_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr TextPath_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr TextPath_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Tspan_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Tspan_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Tspan_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Tspan_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Tspan_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Use_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Use_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr Use_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr Use_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr Use_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr View_ Role (NonEmpty.NonEmpty Event.Event  String ) where
  attr Role bothValues = unsafeAttribute $ Both (pure 
    { key: "role", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr View_ Role (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "role", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "role", value: prop' value })
instance Attr View_ Role  String  where
  attr Role value = unsafeAttribute $ This $ pure $
    { key: "role", value: prop' value }
instance Attr View_ Role (Event.Event  String ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr View_ Role (ST.ST Global.Global  String ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "role", value: prop' value }

instance Attr everything Role (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Role bothValues = unsafeAttribute $ Both (pure  { key: "role", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "role", value: unset' })
instance Attr everything Role (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Role (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "role", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "role", value: unset' })
instance Attr everything Role  Unit  where
  attr Role _ = unsafeAttribute $ This $ pure $ { key: "role", value: unset' }
instance Attr everything Role (Event.Event  Unit ) where
  attr Role eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "role", value: unset' }

instance Attr everything Role (ST.ST Global.Global  Unit ) where
  attr Role stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "role", value: unset' }
