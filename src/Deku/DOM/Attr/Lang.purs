module Deku.DOM.Attr.Lang where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.View (View_)
import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.Metadata (Metadata_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.DOM.Elt.FeTile (FeTile_)
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FePointLight (FePointLight_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.DOM.Elt.FeMergeNode (FeMergeNode_)
import Deku.DOM.Elt.FeMerge (FeMerge_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.DOM.Elt.FeFlood (FeFlood_)
import Deku.DOM.Elt.FeDistantLight (FeDistantLight_)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.DOM.Elt.Discard (Discard_)
import Deku.DOM.Elt.Defs (Defs_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
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

data Lang = Lang

instance Attr A_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr A_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr A_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Abbr_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Abbr_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Abbr_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Acronym_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Acronym_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Acronym_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Address_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Address_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Address_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Applet_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Applet_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Applet_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Area_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Area_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Area_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Article_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Article_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Article_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Aside_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Aside_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Aside_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Audio_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Audio_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Audio_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr B_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr B_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr B_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Base_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Base_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Base_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Basefont_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Basefont_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Basefont_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Bdi_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Bdi_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Bdi_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Bdo_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Bdo_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Bdo_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Big_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Big_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Big_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Blockquote_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Blockquote_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Blockquote_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Body_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Body_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Body_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Br_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Br_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Br_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Button_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Button_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Button_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Canvas_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Canvas_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Canvas_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Caption_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Caption_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Caption_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Center_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Center_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Center_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Cite_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Cite_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Cite_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Code_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Code_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Code_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Col_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Col_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Col_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Colgroup_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Colgroup_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Colgroup_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Xdata_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Xdata_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Xdata_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Datalist_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Datalist_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Datalist_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Dd_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Dd_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Dd_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Del_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Del_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Del_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Details_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Details_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Details_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Dfn_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Dfn_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Dfn_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Dialog_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Dialog_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Dialog_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Dir_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Dir_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Dir_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Div_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Div_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Div_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Dl_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Dl_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Dl_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Dt_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Dt_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Dt_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Em_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Em_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Em_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Embed_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Embed_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Embed_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Fieldset_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Fieldset_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Fieldset_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Figcaption_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Figcaption_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Figcaption_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Figure_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Figure_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Figure_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Font_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Font_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Font_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Footer_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Footer_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Footer_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Form_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Form_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Form_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Frame_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Frame_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Frame_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Frameset_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Frameset_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Frameset_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr H1_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr H1_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr H1_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr H2_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr H2_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr H2_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr H3_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr H3_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr H3_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr H4_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr H4_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr H4_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr H5_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr H5_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr H5_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr H6_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr H6_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr H6_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Head_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Head_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Head_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Header_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Header_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Header_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Hr_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Hr_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Hr_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Html_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Html_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Html_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr I_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr I_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr I_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Iframe_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Iframe_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Iframe_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Img_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Img_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Img_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Input_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Input_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Input_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Ins_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Ins_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Ins_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Kbd_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Kbd_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Kbd_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Label_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Label_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Label_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Legend_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Legend_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Legend_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Li_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Li_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Li_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Link_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Link_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Link_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Main_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Main_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Main_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Map_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Map_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Map_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Mark_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Mark_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Mark_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Meta_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Meta_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Meta_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Meter_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Meter_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Meter_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Nav_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Nav_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Nav_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Noframes_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Noframes_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Noframes_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Noscript_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Noscript_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Noscript_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Object_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Object_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Object_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Ol_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Ol_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Ol_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Optgroup_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Optgroup_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Optgroup_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Option_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Option_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Option_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Output_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Output_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Output_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr P_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr P_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr P_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Param_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Param_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Param_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Picture_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Picture_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Picture_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Pre_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Pre_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Pre_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Progress_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Progress_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Progress_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Q_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Q_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Q_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Rp_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Rp_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Rp_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Rt_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Rt_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Rt_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Ruby_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Ruby_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Ruby_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr S_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr S_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr S_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Samp_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Samp_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Samp_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Script_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Script_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Script_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Section_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Section_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Section_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Select_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Select_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Select_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Small_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Small_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Small_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Source_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Source_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Source_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Span_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Span_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Span_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Strike_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Strike_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Strike_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Strong_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Strong_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Strong_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Style_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Style_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Style_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Sub_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Sub_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Sub_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Summary_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Summary_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Summary_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Sup_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Sup_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Sup_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Svg_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Svg_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Svg_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Table_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Table_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Table_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Tbody_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Tbody_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Tbody_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Td_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Td_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Td_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Template_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Template_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Template_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Textarea_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Textarea_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Textarea_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Tfoot_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Tfoot_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Tfoot_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Th_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Th_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Th_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Thead_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Thead_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Thead_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Time_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Time_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Time_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Title_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Title_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Title_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Tr_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Tr_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Tr_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Track_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Track_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Track_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Tt_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Tt_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Tt_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr U_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr U_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr U_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Ul_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Ul_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Ul_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Var_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Var_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Var_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Video_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Video_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Video_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Wbr_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Wbr_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Wbr_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr AnimateTransform_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr AnimateTransform_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr AnimateTransform_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Defs_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Defs_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Defs_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Discard_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Discard_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Discard_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeBlend_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeBlend_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeBlend_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeColorMatrix_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeColorMatrix_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeColorMatrix_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeComponentTransfer_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeComponentTransfer_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeComponentTransfer_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeComposite_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeComposite_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeComposite_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeConvolveMatrix_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeConvolveMatrix_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeConvolveMatrix_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeDiffuseLighting_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeDiffuseLighting_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeDiffuseLighting_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeDisplacementMap_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeDisplacementMap_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeDisplacementMap_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeDistantLight_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeDistantLight_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeDistantLight_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeFlood_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeFlood_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeFlood_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeFuncA_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeFuncA_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeFuncA_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeFuncB_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeFuncB_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeFuncB_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeFuncG_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeFuncG_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeFuncG_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeFuncR_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeFuncR_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeFuncR_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeGaussianBlur_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeGaussianBlur_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeGaussianBlur_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeImage_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeImage_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeImage_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeMerge_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeMerge_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeMerge_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeMergeNode_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeMergeNode_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeMergeNode_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeMorphology_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeMorphology_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeMorphology_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeOffset_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeOffset_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeOffset_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FePointLight_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FePointLight_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FePointLight_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeSpecularLighting_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeSpecularLighting_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeSpecularLighting_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeSpotLight_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeSpotLight_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeSpotLight_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeTile_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeTile_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeTile_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr FeTurbulence_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr FeTurbulence_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr FeTurbulence_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Filter_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Filter_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Filter_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Image_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Image_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Image_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Metadata_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Metadata_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Metadata_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Mpath_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Mpath_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Mpath_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr Switch_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr Switch_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr Switch_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr View_ Lang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Lang bothValues = unsafeAttribute $ Both
    { key: "lang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lang", value: prop' value })
instance Attr View_ Lang  String  where
  attr Lang value = unsafeAttribute $ This $ pure $
    { key: "lang", value: prop' value }
instance Attr View_ Lang (Event.Event  String ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "lang", value: prop' value }

instance Attr everything Lang (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Lang bothValues = unsafeAttribute $ Both { key: "lang", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "lang", value: unset' })
instance Attr everything Lang  Unit  where
  attr Lang _ = unsafeAttribute $ This $ pure $ { key: "lang", value: unset' }
instance Attr everything Lang (Event.Event  Unit ) where
  attr Lang eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "lang", value: unset' }
