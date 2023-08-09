module Deku.DOM.Attr.GlyphOrientationHorizontal where
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
data GlyphOrientationHorizontal = GlyphOrientationHorizontal
instance Attr FeBlend_ GlyphOrientationHorizontal  String  where
  attr GlyphOrientationHorizontal value = unsafeAttribute (  
    { key: "glyph-orientation-horizontal", value: prop' value  } <$ _)
instance Attr FeBlend_ GlyphOrientationHorizontal (Event.Event Unit -> Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute (map (map ( \value ->
      { key: "glyph-orientation-horizontal", value: prop' value })) eventValue)
instance Attr FeBlend_ GlyphOrientationHorizontal (Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-horizontal", value: prop' value }
instance Attr FeColorMatrix_ GlyphOrientationHorizontal  String  where
  attr GlyphOrientationHorizontal value = unsafeAttribute (  
    { key: "glyph-orientation-horizontal", value: prop' value  } <$ _)
instance Attr FeColorMatrix_ GlyphOrientationHorizontal (Event.Event Unit -> Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute (map (map ( \value ->
      { key: "glyph-orientation-horizontal", value: prop' value })) eventValue)
instance Attr FeColorMatrix_ GlyphOrientationHorizontal (Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-horizontal", value: prop' value }
instance Attr FeComponentTransfer_ GlyphOrientationHorizontal  String  where
  attr GlyphOrientationHorizontal value = unsafeAttribute (  
    { key: "glyph-orientation-horizontal", value: prop' value  } <$ _)
instance Attr FeComponentTransfer_ GlyphOrientationHorizontal (Event.Event Unit -> Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute (map (map ( \value ->
      { key: "glyph-orientation-horizontal", value: prop' value })) eventValue)
instance Attr FeComponentTransfer_ GlyphOrientationHorizontal (Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-horizontal", value: prop' value }
instance Attr FeComposite_ GlyphOrientationHorizontal  String  where
  attr GlyphOrientationHorizontal value = unsafeAttribute (  
    { key: "glyph-orientation-horizontal", value: prop' value  } <$ _)
instance Attr FeComposite_ GlyphOrientationHorizontal (Event.Event Unit -> Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute (map (map ( \value ->
      { key: "glyph-orientation-horizontal", value: prop' value })) eventValue)
instance Attr FeComposite_ GlyphOrientationHorizontal (Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-horizontal", value: prop' value }
instance Attr FeConvolveMatrix_ GlyphOrientationHorizontal  String  where
  attr GlyphOrientationHorizontal value = unsafeAttribute (  
    { key: "glyph-orientation-horizontal", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ GlyphOrientationHorizontal (Event.Event Unit -> Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute (map (map ( \value ->
      { key: "glyph-orientation-horizontal", value: prop' value })) eventValue)
instance Attr FeConvolveMatrix_ GlyphOrientationHorizontal (Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-horizontal", value: prop' value }
instance Attr FeDiffuseLighting_ GlyphOrientationHorizontal  String  where
  attr GlyphOrientationHorizontal value = unsafeAttribute (  
    { key: "glyph-orientation-horizontal", value: prop' value  } <$ _)
instance Attr FeDiffuseLighting_ GlyphOrientationHorizontal (Event.Event Unit -> Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute (map (map ( \value ->
      { key: "glyph-orientation-horizontal", value: prop' value })) eventValue)
instance Attr FeDiffuseLighting_ GlyphOrientationHorizontal (Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-horizontal", value: prop' value }
instance Attr FeDisplacementMap_ GlyphOrientationHorizontal  String  where
  attr GlyphOrientationHorizontal value = unsafeAttribute (  
    { key: "glyph-orientation-horizontal", value: prop' value  } <$ _)
instance Attr FeDisplacementMap_ GlyphOrientationHorizontal (Event.Event Unit -> Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute (map (map ( \value ->
      { key: "glyph-orientation-horizontal", value: prop' value })) eventValue)
instance Attr FeDisplacementMap_ GlyphOrientationHorizontal (Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-horizontal", value: prop' value }
instance Attr FeFlood_ GlyphOrientationHorizontal  String  where
  attr GlyphOrientationHorizontal value = unsafeAttribute (  
    { key: "glyph-orientation-horizontal", value: prop' value  } <$ _)
instance Attr FeFlood_ GlyphOrientationHorizontal (Event.Event Unit -> Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute (map (map ( \value ->
      { key: "glyph-orientation-horizontal", value: prop' value })) eventValue)
instance Attr FeFlood_ GlyphOrientationHorizontal (Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-horizontal", value: prop' value }
instance Attr FeGaussianBlur_ GlyphOrientationHorizontal  String  where
  attr GlyphOrientationHorizontal value = unsafeAttribute (  
    { key: "glyph-orientation-horizontal", value: prop' value  } <$ _)
instance Attr FeGaussianBlur_ GlyphOrientationHorizontal (Event.Event Unit -> Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute (map (map ( \value ->
      { key: "glyph-orientation-horizontal", value: prop' value })) eventValue)
instance Attr FeGaussianBlur_ GlyphOrientationHorizontal (Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-horizontal", value: prop' value }
instance Attr FeImage_ GlyphOrientationHorizontal  String  where
  attr GlyphOrientationHorizontal value = unsafeAttribute (  
    { key: "glyph-orientation-horizontal", value: prop' value  } <$ _)
instance Attr FeImage_ GlyphOrientationHorizontal (Event.Event Unit -> Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute (map (map ( \value ->
      { key: "glyph-orientation-horizontal", value: prop' value })) eventValue)
instance Attr FeImage_ GlyphOrientationHorizontal (Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-horizontal", value: prop' value }
instance Attr FeMerge_ GlyphOrientationHorizontal  String  where
  attr GlyphOrientationHorizontal value = unsafeAttribute (  
    { key: "glyph-orientation-horizontal", value: prop' value  } <$ _)
instance Attr FeMerge_ GlyphOrientationHorizontal (Event.Event Unit -> Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute (map (map ( \value ->
      { key: "glyph-orientation-horizontal", value: prop' value })) eventValue)
instance Attr FeMerge_ GlyphOrientationHorizontal (Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-horizontal", value: prop' value }
instance Attr FeMorphology_ GlyphOrientationHorizontal  String  where
  attr GlyphOrientationHorizontal value = unsafeAttribute (  
    { key: "glyph-orientation-horizontal", value: prop' value  } <$ _)
instance Attr FeMorphology_ GlyphOrientationHorizontal (Event.Event Unit -> Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute (map (map ( \value ->
      { key: "glyph-orientation-horizontal", value: prop' value })) eventValue)
instance Attr FeMorphology_ GlyphOrientationHorizontal (Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-horizontal", value: prop' value }
instance Attr FeOffset_ GlyphOrientationHorizontal  String  where
  attr GlyphOrientationHorizontal value = unsafeAttribute (  
    { key: "glyph-orientation-horizontal", value: prop' value  } <$ _)
instance Attr FeOffset_ GlyphOrientationHorizontal (Event.Event Unit -> Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute (map (map ( \value ->
      { key: "glyph-orientation-horizontal", value: prop' value })) eventValue)
instance Attr FeOffset_ GlyphOrientationHorizontal (Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-horizontal", value: prop' value }
instance Attr FeSpecularLighting_ GlyphOrientationHorizontal  String  where
  attr GlyphOrientationHorizontal value = unsafeAttribute (  
    { key: "glyph-orientation-horizontal", value: prop' value  } <$ _)
instance Attr FeSpecularLighting_ GlyphOrientationHorizontal (Event.Event Unit -> Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute (map (map ( \value ->
      { key: "glyph-orientation-horizontal", value: prop' value })) eventValue)
instance Attr FeSpecularLighting_ GlyphOrientationHorizontal (Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-horizontal", value: prop' value }
instance Attr FeTile_ GlyphOrientationHorizontal  String  where
  attr GlyphOrientationHorizontal value = unsafeAttribute (  
    { key: "glyph-orientation-horizontal", value: prop' value  } <$ _)
instance Attr FeTile_ GlyphOrientationHorizontal (Event.Event Unit -> Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute (map (map ( \value ->
      { key: "glyph-orientation-horizontal", value: prop' value })) eventValue)
instance Attr FeTile_ GlyphOrientationHorizontal (Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-horizontal", value: prop' value }
instance Attr FeTurbulence_ GlyphOrientationHorizontal  String  where
  attr GlyphOrientationHorizontal value = unsafeAttribute (  
    { key: "glyph-orientation-horizontal", value: prop' value  } <$ _)
instance Attr FeTurbulence_ GlyphOrientationHorizontal (Event.Event Unit -> Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute (map (map ( \value ->
      { key: "glyph-orientation-horizontal", value: prop' value })) eventValue)
instance Attr FeTurbulence_ GlyphOrientationHorizontal (Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-horizontal", value: prop' value }
instance Attr Filter_ GlyphOrientationHorizontal  String  where
  attr GlyphOrientationHorizontal value = unsafeAttribute (  
    { key: "glyph-orientation-horizontal", value: prop' value  } <$ _)
instance Attr Filter_ GlyphOrientationHorizontal (Event.Event Unit -> Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute (map (map ( \value ->
      { key: "glyph-orientation-horizontal", value: prop' value })) eventValue)
instance Attr Filter_ GlyphOrientationHorizontal (Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-horizontal", value: prop' value }
instance Attr Image_ GlyphOrientationHorizontal  String  where
  attr GlyphOrientationHorizontal value = unsafeAttribute (  
    { key: "glyph-orientation-horizontal", value: prop' value  } <$ _)
instance Attr Image_ GlyphOrientationHorizontal (Event.Event Unit -> Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute (map (map ( \value ->
      { key: "glyph-orientation-horizontal", value: prop' value })) eventValue)
instance Attr Image_ GlyphOrientationHorizontal (Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-horizontal", value: prop' value }
instance Attr Switch_ GlyphOrientationHorizontal  String  where
  attr GlyphOrientationHorizontal value = unsafeAttribute (  
    { key: "glyph-orientation-horizontal", value: prop' value  } <$ _)
instance Attr Switch_ GlyphOrientationHorizontal (Event.Event Unit -> Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute (map (map ( \value ->
      { key: "glyph-orientation-horizontal", value: prop' value })) eventValue)
instance Attr Switch_ GlyphOrientationHorizontal (Event.Event  String ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-horizontal", value: prop' value }
instance Attr everything GlyphOrientationHorizontal  Unit  where
  attr GlyphOrientationHorizontal _ = unsafeAttribute (  
    { key: "glyph-orientation-horizontal", value: unset'  } <$ _)
instance Attr everything GlyphOrientationHorizontal (Event.Event Unit -> Event.Event  Unit ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute (map (map ( \_ -> { key: "glyph-orientation-horizontal", value: unset' })) eventValue)
instance Attr everything GlyphOrientationHorizontal (Event.Event  Unit ) where
  attr GlyphOrientationHorizontal eventValue = unsafeAttribute \_ ->
    eventValue <#> \_ -> { key: "glyph-orientation-horizontal", value: unset' }