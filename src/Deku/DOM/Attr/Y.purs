module Deku.DOM.Attr.Y where
import Prelude
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.DOM.Elt.FeFlood (FeFlood_)
import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.FeMerge (FeMerge_)
import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FePointLight (FePointLight_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.DOM.Elt.FeTile (FeTile_)
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Mask (Mask_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Use (Use_)
import FRP.Event as Event
data Y = Y
instance Attr FeBlend_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr FeBlend_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr FeBlend_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr FeColorMatrix_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr FeColorMatrix_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr FeColorMatrix_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr FeComponentTransfer_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr FeComponentTransfer_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr FeComponentTransfer_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr FeComposite_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr FeComposite_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr FeComposite_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr FeConvolveMatrix_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr FeConvolveMatrix_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr FeDiffuseLighting_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr FeDiffuseLighting_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr FeDiffuseLighting_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr FeDisplacementMap_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr FeDisplacementMap_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr FeDisplacementMap_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr FeDropShadow_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr FeDropShadow_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr FeDropShadow_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr FeFlood_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr FeFlood_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr FeFlood_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr FeGaussianBlur_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr FeGaussianBlur_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr FeGaussianBlur_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr FeImage_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr FeImage_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr FeImage_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr FeMerge_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr FeMerge_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr FeMerge_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr FeMorphology_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr FeMorphology_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr FeMorphology_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr FeOffset_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr FeOffset_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr FeOffset_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr FePointLight_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr FePointLight_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr FePointLight_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr FeSpecularLighting_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr FeSpecularLighting_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr FeSpecularLighting_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr FeSpotLight_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr FeSpotLight_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr FeSpotLight_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr FeTile_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr FeTile_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr FeTile_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr FeTurbulence_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr FeTurbulence_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr FeTurbulence_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr Filter_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr Filter_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr Filter_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr ForeignObject_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr ForeignObject_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr ForeignObject_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr Image_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr Image_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr Image_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr Mask_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr Mask_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr Mask_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr Pattern_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr Pattern_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr Pattern_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr Rect_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr Rect_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr Rect_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr Svg_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr Svg_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr Svg_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr Symbol_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr Symbol_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr Symbol_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr Text_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr Text_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr Text_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr Tspan_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr Tspan_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr Tspan_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr Use_ Y  String  where
  attr Y value = unsafeAttribute (  { key: "y", value: prop' value  } <$ _)
instance Attr Use_ Y (Event.Event Unit -> Event.Event  String ) where
  attr Y eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y", value: prop' value })) eventValue)
instance Attr Use_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y", value: prop' value }
instance Attr everything Y  Unit  where
  attr Y _ = unsafeAttribute (  { key: "y", value: unset'  } <$ _)
instance Attr everything Y (Event.Event Unit -> Event.Event  Unit ) where
  attr Y eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "y", value: unset' })) eventValue)
instance Attr everything Y (Event.Event  Unit ) where
  attr Y eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "y", value: unset' }