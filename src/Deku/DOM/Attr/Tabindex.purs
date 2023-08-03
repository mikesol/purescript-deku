module Deku.DOM.Attr.Tabindex where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.View (View_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Title (Title_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Stop (Stop_)
import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.Metadata (Metadata_)
import Deku.DOM.Elt.Mask (Mask_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
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
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.DOM.Elt.FeDistantLight (FeDistantLight_)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.DOM.Elt.Discard (Discard_)
import Deku.DOM.Elt.Desc (Desc_)
import Deku.DOM.Elt.ClipPath (ClipPath_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
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
import Deku.DOM.Elt.Tr (Tr_)
import Deku.DOM.Elt.Track (Track_)
import Deku.DOM.Elt.Tt (Tt_)
import Deku.DOM.Elt.U (U_)
import Deku.DOM.Elt.Ul (Ul_)
import Deku.DOM.Elt.Var (Var_)
import Deku.DOM.Elt.Video (Video_)
import Deku.DOM.Elt.Wbr (Wbr_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Tabindex = Tabindex

instance Attr A_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr A_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr A_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Abbr_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Abbr_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Abbr_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Acronym_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Acronym_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Acronym_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Address_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Address_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Address_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Applet_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Applet_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Applet_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Area_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Area_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Area_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Article_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Article_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Article_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Aside_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Aside_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Aside_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Audio_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Audio_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Audio_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr B_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr B_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr B_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Base_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Base_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Base_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Basefont_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Basefont_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Basefont_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Bdi_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Bdi_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Bdi_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Bdo_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Bdo_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Bdo_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Big_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Big_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Big_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Blockquote_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Blockquote_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Blockquote_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Body_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Body_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Body_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Br_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Br_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Br_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Button_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Button_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Button_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Canvas_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Canvas_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Canvas_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Caption_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Caption_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Caption_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Center_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Center_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Center_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Cite_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Cite_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Cite_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Code_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Code_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Code_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Col_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Col_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Col_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Colgroup_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Colgroup_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Colgroup_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Xdata_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Xdata_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Xdata_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Datalist_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Datalist_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Datalist_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Dd_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Dd_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Dd_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Del_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Del_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Del_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Details_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Details_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Details_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Dfn_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Dfn_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Dfn_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Dialog_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Dialog_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Dialog_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Dir_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Dir_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Dir_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Div_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Div_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Div_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Dl_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Dl_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Dl_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Dt_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Dt_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Dt_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Em_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Em_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Em_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Embed_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Embed_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Embed_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Fieldset_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Fieldset_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Fieldset_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Figcaption_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Figcaption_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Figcaption_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Figure_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Figure_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Figure_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Font_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Font_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Font_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Footer_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Footer_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Footer_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Form_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Form_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Form_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Frame_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Frame_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Frame_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Frameset_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Frameset_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Frameset_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr H1_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr H1_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr H1_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr H2_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr H2_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr H2_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr H3_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr H3_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr H3_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr H4_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr H4_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr H4_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr H5_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr H5_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr H5_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr H6_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr H6_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr H6_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Head_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Head_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Head_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Header_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Header_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Header_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Hr_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Hr_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Hr_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Html_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Html_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Html_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr I_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr I_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr I_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Iframe_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Iframe_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Iframe_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Img_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Img_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Img_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Input_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Input_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Input_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Ins_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Ins_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Ins_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Kbd_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Kbd_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Kbd_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Label_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Label_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Label_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Legend_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Legend_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Legend_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Li_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Li_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Li_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Link_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Link_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Link_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Main_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Main_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Main_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Map_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Map_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Map_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Mark_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Mark_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Mark_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Meta_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Meta_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Meta_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Meter_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Meter_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Meter_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Nav_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Nav_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Nav_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Noframes_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Noframes_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Noframes_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Noscript_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Noscript_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Noscript_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Object_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Object_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Object_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Ol_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Ol_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Ol_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Optgroup_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Optgroup_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Optgroup_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Option_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Option_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Option_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Output_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Output_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Output_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr P_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr P_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr P_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Param_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Param_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Param_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Picture_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Picture_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Picture_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Pre_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Pre_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Pre_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Progress_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Progress_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Progress_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Q_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Q_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Q_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Rp_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Rp_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Rp_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Rt_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Rt_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Rt_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Ruby_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Ruby_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Ruby_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr S_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr S_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr S_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Samp_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Samp_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Samp_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Script_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Script_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Script_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Section_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Section_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Section_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Select_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Select_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Select_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Small_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Small_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Small_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Source_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Source_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Source_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Span_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Span_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Span_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Strike_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Strike_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Strike_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Strong_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Strong_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Strong_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Style_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Style_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Style_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Sub_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Sub_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Sub_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Summary_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Summary_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Summary_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Sup_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Sup_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Sup_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Svg_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Svg_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Svg_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Table_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Table_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Table_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Tbody_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Tbody_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Tbody_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Td_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Td_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Td_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Template_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Template_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Template_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Textarea_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Textarea_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Textarea_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Tfoot_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Tfoot_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Tfoot_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Th_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Th_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Th_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Thead_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Thead_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Thead_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Time_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Time_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Time_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Title_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Title_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Title_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Tr_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Tr_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Tr_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Track_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Track_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Track_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Tt_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Tt_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Tt_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr U_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr U_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr U_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Ul_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Ul_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Ul_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Var_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Var_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Var_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Video_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Video_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Video_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Wbr_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Wbr_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Wbr_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Animate_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Animate_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Animate_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr AnimateMotion_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr AnimateMotion_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr AnimateMotion_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr AnimateTransform_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr AnimateTransform_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr AnimateTransform_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr ClipPath_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr ClipPath_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr ClipPath_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Desc_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Desc_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Desc_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Discard_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Discard_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Discard_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeBlend_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeBlend_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeBlend_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeColorMatrix_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeColorMatrix_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeColorMatrix_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeComponentTransfer_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeComponentTransfer_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeComponentTransfer_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeComposite_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeComposite_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeComposite_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeConvolveMatrix_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeConvolveMatrix_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeConvolveMatrix_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeDiffuseLighting_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeDiffuseLighting_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeDiffuseLighting_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeDisplacementMap_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeDisplacementMap_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeDisplacementMap_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeDistantLight_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeDistantLight_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeDistantLight_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeDropShadow_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeDropShadow_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeDropShadow_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeFlood_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeFlood_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeFlood_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeFuncA_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeFuncA_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeFuncA_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeFuncB_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeFuncB_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeFuncB_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeFuncG_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeFuncG_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeFuncG_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeFuncR_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeFuncR_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeFuncR_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeGaussianBlur_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeGaussianBlur_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeGaussianBlur_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeImage_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeImage_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeImage_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeMerge_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeMerge_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeMerge_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeMergeNode_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeMergeNode_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeMergeNode_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeMorphology_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeMorphology_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeMorphology_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeOffset_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeOffset_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeOffset_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FePointLight_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FePointLight_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FePointLight_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeSpecularLighting_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeSpecularLighting_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeSpecularLighting_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeSpotLight_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeSpotLight_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeSpotLight_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeTile_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeTile_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeTile_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr FeTurbulence_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr FeTurbulence_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr FeTurbulence_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Filter_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Filter_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Filter_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Image_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Image_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Image_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr LinearGradient_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr LinearGradient_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr LinearGradient_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Mask_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Mask_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Mask_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Metadata_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Metadata_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Metadata_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Mpath_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Mpath_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Mpath_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr RadialGradient_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr RadialGradient_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr RadialGradient_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Set_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Set_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Set_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Stop_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Stop_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Stop_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Switch_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Switch_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Switch_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Symbol_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Symbol_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Symbol_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Text_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Text_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Text_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr Tspan_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr Tspan_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr Tspan_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr View_ Tabindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "tabindex", value: prop' value })
instance Attr View_ Tabindex  String  where
  attr Tabindex value = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: prop' value }
instance Attr View_ Tabindex (Event.Event  String ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tabindex", value: prop' value }

instance Attr everything Tabindex (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Tabindex bothValues = unsafeAttribute $ Both (pure 
    { key: "tabindex", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "tabindex", value: unset' })
instance Attr everything Tabindex  Unit  where
  attr Tabindex _ = unsafeAttribute $ This $ pure $
    { key: "tabindex", value: unset' }
instance Attr everything Tabindex (Event.Event  Unit ) where
  attr Tabindex eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "tabindex", value: unset' }
