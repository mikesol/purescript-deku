module Deku.DOM.Attr.ColorInterpolationFilters where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.DOM.Elt.FeTile (FeTile_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.DOM.Elt.FeMerge (FeMerge_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeFlood (FeFlood_)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data ColorInterpolationFilters = ColorInterpolationFilters
instance Attr FeBlend_ ColorInterpolationFilters  String  where
  attr ColorInterpolationFilters value = unsafeAttribute (  
    { key: "color-interpolation-filters", value: prop' value  } <$ _)
instance Attr FeBlend_ ColorInterpolationFilters (Event.Event Unit -> Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute (map (map ( \value ->
      { key: "color-interpolation-filters", value: prop' value })) eventValue)
instance Attr FeBlend_ ColorInterpolationFilters (Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "color-interpolation-filters", value: prop' value }
instance Attr FeColorMatrix_ ColorInterpolationFilters  String  where
  attr ColorInterpolationFilters value = unsafeAttribute (  
    { key: "color-interpolation-filters", value: prop' value  } <$ _)
instance Attr FeColorMatrix_ ColorInterpolationFilters (Event.Event Unit -> Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute (map (map ( \value ->
      { key: "color-interpolation-filters", value: prop' value })) eventValue)
instance Attr FeColorMatrix_ ColorInterpolationFilters (Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "color-interpolation-filters", value: prop' value }
instance Attr FeComponentTransfer_ ColorInterpolationFilters  String  where
  attr ColorInterpolationFilters value = unsafeAttribute (  
    { key: "color-interpolation-filters", value: prop' value  } <$ _)
instance Attr FeComponentTransfer_ ColorInterpolationFilters (Event.Event Unit -> Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute (map (map ( \value ->
      { key: "color-interpolation-filters", value: prop' value })) eventValue)
instance Attr FeComponentTransfer_ ColorInterpolationFilters (Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "color-interpolation-filters", value: prop' value }
instance Attr FeComposite_ ColorInterpolationFilters  String  where
  attr ColorInterpolationFilters value = unsafeAttribute (  
    { key: "color-interpolation-filters", value: prop' value  } <$ _)
instance Attr FeComposite_ ColorInterpolationFilters (Event.Event Unit -> Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute (map (map ( \value ->
      { key: "color-interpolation-filters", value: prop' value })) eventValue)
instance Attr FeComposite_ ColorInterpolationFilters (Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "color-interpolation-filters", value: prop' value }
instance Attr FeConvolveMatrix_ ColorInterpolationFilters  String  where
  attr ColorInterpolationFilters value = unsafeAttribute (  
    { key: "color-interpolation-filters", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ ColorInterpolationFilters (Event.Event Unit -> Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute (map (map ( \value ->
      { key: "color-interpolation-filters", value: prop' value })) eventValue)
instance Attr FeConvolveMatrix_ ColorInterpolationFilters (Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "color-interpolation-filters", value: prop' value }
instance Attr FeDiffuseLighting_ ColorInterpolationFilters  String  where
  attr ColorInterpolationFilters value = unsafeAttribute (  
    { key: "color-interpolation-filters", value: prop' value  } <$ _)
instance Attr FeDiffuseLighting_ ColorInterpolationFilters (Event.Event Unit -> Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute (map (map ( \value ->
      { key: "color-interpolation-filters", value: prop' value })) eventValue)
instance Attr FeDiffuseLighting_ ColorInterpolationFilters (Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "color-interpolation-filters", value: prop' value }
instance Attr FeDisplacementMap_ ColorInterpolationFilters  String  where
  attr ColorInterpolationFilters value = unsafeAttribute (  
    { key: "color-interpolation-filters", value: prop' value  } <$ _)
instance Attr FeDisplacementMap_ ColorInterpolationFilters (Event.Event Unit -> Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute (map (map ( \value ->
      { key: "color-interpolation-filters", value: prop' value })) eventValue)
instance Attr FeDisplacementMap_ ColorInterpolationFilters (Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "color-interpolation-filters", value: prop' value }
instance Attr FeFlood_ ColorInterpolationFilters  String  where
  attr ColorInterpolationFilters value = unsafeAttribute (  
    { key: "color-interpolation-filters", value: prop' value  } <$ _)
instance Attr FeFlood_ ColorInterpolationFilters (Event.Event Unit -> Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute (map (map ( \value ->
      { key: "color-interpolation-filters", value: prop' value })) eventValue)
instance Attr FeFlood_ ColorInterpolationFilters (Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "color-interpolation-filters", value: prop' value }
instance Attr FeGaussianBlur_ ColorInterpolationFilters  String  where
  attr ColorInterpolationFilters value = unsafeAttribute (  
    { key: "color-interpolation-filters", value: prop' value  } <$ _)
instance Attr FeGaussianBlur_ ColorInterpolationFilters (Event.Event Unit -> Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute (map (map ( \value ->
      { key: "color-interpolation-filters", value: prop' value })) eventValue)
instance Attr FeGaussianBlur_ ColorInterpolationFilters (Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "color-interpolation-filters", value: prop' value }
instance Attr FeImage_ ColorInterpolationFilters  String  where
  attr ColorInterpolationFilters value = unsafeAttribute (  
    { key: "color-interpolation-filters", value: prop' value  } <$ _)
instance Attr FeImage_ ColorInterpolationFilters (Event.Event Unit -> Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute (map (map ( \value ->
      { key: "color-interpolation-filters", value: prop' value })) eventValue)
instance Attr FeImage_ ColorInterpolationFilters (Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "color-interpolation-filters", value: prop' value }
instance Attr FeMerge_ ColorInterpolationFilters  String  where
  attr ColorInterpolationFilters value = unsafeAttribute (  
    { key: "color-interpolation-filters", value: prop' value  } <$ _)
instance Attr FeMerge_ ColorInterpolationFilters (Event.Event Unit -> Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute (map (map ( \value ->
      { key: "color-interpolation-filters", value: prop' value })) eventValue)
instance Attr FeMerge_ ColorInterpolationFilters (Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "color-interpolation-filters", value: prop' value }
instance Attr FeMorphology_ ColorInterpolationFilters  String  where
  attr ColorInterpolationFilters value = unsafeAttribute (  
    { key: "color-interpolation-filters", value: prop' value  } <$ _)
instance Attr FeMorphology_ ColorInterpolationFilters (Event.Event Unit -> Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute (map (map ( \value ->
      { key: "color-interpolation-filters", value: prop' value })) eventValue)
instance Attr FeMorphology_ ColorInterpolationFilters (Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "color-interpolation-filters", value: prop' value }
instance Attr FeOffset_ ColorInterpolationFilters  String  where
  attr ColorInterpolationFilters value = unsafeAttribute (  
    { key: "color-interpolation-filters", value: prop' value  } <$ _)
instance Attr FeOffset_ ColorInterpolationFilters (Event.Event Unit -> Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute (map (map ( \value ->
      { key: "color-interpolation-filters", value: prop' value })) eventValue)
instance Attr FeOffset_ ColorInterpolationFilters (Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "color-interpolation-filters", value: prop' value }
instance Attr FeSpecularLighting_ ColorInterpolationFilters  String  where
  attr ColorInterpolationFilters value = unsafeAttribute (  
    { key: "color-interpolation-filters", value: prop' value  } <$ _)
instance Attr FeSpecularLighting_ ColorInterpolationFilters (Event.Event Unit -> Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute (map (map ( \value ->
      { key: "color-interpolation-filters", value: prop' value })) eventValue)
instance Attr FeSpecularLighting_ ColorInterpolationFilters (Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "color-interpolation-filters", value: prop' value }
instance Attr FeTile_ ColorInterpolationFilters  String  where
  attr ColorInterpolationFilters value = unsafeAttribute (  
    { key: "color-interpolation-filters", value: prop' value  } <$ _)
instance Attr FeTile_ ColorInterpolationFilters (Event.Event Unit -> Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute (map (map ( \value ->
      { key: "color-interpolation-filters", value: prop' value })) eventValue)
instance Attr FeTile_ ColorInterpolationFilters (Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "color-interpolation-filters", value: prop' value }
instance Attr FeTurbulence_ ColorInterpolationFilters  String  where
  attr ColorInterpolationFilters value = unsafeAttribute (  
    { key: "color-interpolation-filters", value: prop' value  } <$ _)
instance Attr FeTurbulence_ ColorInterpolationFilters (Event.Event Unit -> Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute (map (map ( \value ->
      { key: "color-interpolation-filters", value: prop' value })) eventValue)
instance Attr FeTurbulence_ ColorInterpolationFilters (Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "color-interpolation-filters", value: prop' value }
instance Attr Filter_ ColorInterpolationFilters  String  where
  attr ColorInterpolationFilters value = unsafeAttribute (  
    { key: "color-interpolation-filters", value: prop' value  } <$ _)
instance Attr Filter_ ColorInterpolationFilters (Event.Event Unit -> Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute (map (map ( \value ->
      { key: "color-interpolation-filters", value: prop' value })) eventValue)
instance Attr Filter_ ColorInterpolationFilters (Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "color-interpolation-filters", value: prop' value }
instance Attr Image_ ColorInterpolationFilters  String  where
  attr ColorInterpolationFilters value = unsafeAttribute (  
    { key: "color-interpolation-filters", value: prop' value  } <$ _)
instance Attr Image_ ColorInterpolationFilters (Event.Event Unit -> Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute (map (map ( \value ->
      { key: "color-interpolation-filters", value: prop' value })) eventValue)
instance Attr Image_ ColorInterpolationFilters (Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "color-interpolation-filters", value: prop' value }
instance Attr Switch_ ColorInterpolationFilters  String  where
  attr ColorInterpolationFilters value = unsafeAttribute (  
    { key: "color-interpolation-filters", value: prop' value  } <$ _)
instance Attr Switch_ ColorInterpolationFilters (Event.Event Unit -> Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute (map (map ( \value ->
      { key: "color-interpolation-filters", value: prop' value })) eventValue)
instance Attr Switch_ ColorInterpolationFilters (Event.Event  String ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "color-interpolation-filters", value: prop' value }
instance Attr everything ColorInterpolationFilters  Unit  where
  attr ColorInterpolationFilters _ = unsafeAttribute (  
    { key: "color-interpolation-filters", value: unset'  } <$ _)
instance Attr everything ColorInterpolationFilters (Event.Event Unit -> Event.Event  Unit ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute (map (map ( \_ -> { key: "color-interpolation-filters", value: unset' })) eventValue)
instance Attr everything ColorInterpolationFilters (Event.Event  Unit ) where
  attr ColorInterpolationFilters eventValue = unsafeAttribute \_ ->
    eventValue <#> \_ -> { key: "color-interpolation-filters", value: unset' }