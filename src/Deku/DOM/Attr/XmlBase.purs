module Deku.DOM.Attr.XmlBase where
import Prelude
import FRP.Event as Event
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
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data XmlBase = XmlBase
instance Attr AnimateTransform_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr AnimateTransform_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr AnimateTransform_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr Discard_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr Discard_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr Discard_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeBlend_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeBlend_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeBlend_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeColorMatrix_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeColorMatrix_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeColorMatrix_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeComponentTransfer_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeComponentTransfer_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeComponentTransfer_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeComposite_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeComposite_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeComposite_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeConvolveMatrix_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeConvolveMatrix_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeDiffuseLighting_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeDiffuseLighting_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeDiffuseLighting_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeDisplacementMap_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeDisplacementMap_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeDisplacementMap_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeDistantLight_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeDistantLight_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeDistantLight_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeFlood_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeFlood_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeFlood_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeFuncA_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeFuncA_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeFuncA_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeFuncB_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeFuncB_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeFuncB_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeFuncG_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeFuncG_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeFuncG_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeFuncR_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeFuncR_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeFuncR_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeGaussianBlur_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeGaussianBlur_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeGaussianBlur_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeImage_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeImage_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeImage_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeMerge_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeMerge_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeMerge_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeMergeNode_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeMergeNode_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeMergeNode_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeMorphology_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeMorphology_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeMorphology_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeOffset_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeOffset_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeOffset_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FePointLight_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FePointLight_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FePointLight_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeSpecularLighting_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeSpecularLighting_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeSpecularLighting_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeSpotLight_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeSpotLight_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeSpotLight_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeTile_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeTile_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeTile_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr FeTurbulence_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr FeTurbulence_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr FeTurbulence_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr Filter_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr Filter_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr Filter_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr Image_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr Image_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr Image_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr Metadata_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr Metadata_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr Metadata_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr Mpath_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr Mpath_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr Mpath_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr Switch_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr Switch_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr Switch_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr View_ XmlBase  String  where
  attr XmlBase value = unsafeAttribute (  
    { key: "xml:base", value: prop' value  } <$ _)
instance Attr View_ XmlBase (Event.Event Unit -> Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute (map (map (
    \value -> { key: "xml:base", value: prop' value })) eventValue)
instance Attr View_ XmlBase (Event.Event  String ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xml:base", value: prop' value }
instance Attr everything XmlBase  Unit  where
  attr XmlBase _ = unsafeAttribute (  { key: "xml:base", value: unset'  } <$ _)
instance Attr everything XmlBase (Event.Event Unit -> Event.Event  Unit ) where
  attr XmlBase eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "xml:base", value: unset' })) eventValue)
instance Attr everything XmlBase (Event.Event  Unit ) where
  attr XmlBase eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "xml:base", value: unset' }