module Deku.DOM.Attr.GlyphOrientationVertical where


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

data GlyphOrientationVertical = GlyphOrientationVertical

instance Attr FeBlend_ GlyphOrientationVertical  String  where
  attr GlyphOrientationVertical value = unsafeAttribute (  
    { key: "glyph-orientation-vertical", value: prop' value  } <$ _)
instance Attr FeBlend_ GlyphOrientationVertical (Event.Event  String ) where
  attr GlyphOrientationVertical eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-vertical", value: prop' value }


instance Attr FeColorMatrix_ GlyphOrientationVertical  String  where
  attr GlyphOrientationVertical value = unsafeAttribute (  
    { key: "glyph-orientation-vertical", value: prop' value  } <$ _)
instance Attr FeColorMatrix_ GlyphOrientationVertical (Event.Event  String ) where
  attr GlyphOrientationVertical eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-vertical", value: prop' value }


instance Attr FeComponentTransfer_ GlyphOrientationVertical  String  where
  attr GlyphOrientationVertical value = unsafeAttribute (  
    { key: "glyph-orientation-vertical", value: prop' value  } <$ _)
instance Attr FeComponentTransfer_ GlyphOrientationVertical (Event.Event  String ) where
  attr GlyphOrientationVertical eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-vertical", value: prop' value }


instance Attr FeComposite_ GlyphOrientationVertical  String  where
  attr GlyphOrientationVertical value = unsafeAttribute (  
    { key: "glyph-orientation-vertical", value: prop' value  } <$ _)
instance Attr FeComposite_ GlyphOrientationVertical (Event.Event  String ) where
  attr GlyphOrientationVertical eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-vertical", value: prop' value }


instance Attr FeConvolveMatrix_ GlyphOrientationVertical  String  where
  attr GlyphOrientationVertical value = unsafeAttribute (  
    { key: "glyph-orientation-vertical", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ GlyphOrientationVertical (Event.Event  String ) where
  attr GlyphOrientationVertical eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-vertical", value: prop' value }


instance Attr FeDiffuseLighting_ GlyphOrientationVertical  String  where
  attr GlyphOrientationVertical value = unsafeAttribute (  
    { key: "glyph-orientation-vertical", value: prop' value  } <$ _)
instance Attr FeDiffuseLighting_ GlyphOrientationVertical (Event.Event  String ) where
  attr GlyphOrientationVertical eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-vertical", value: prop' value }


instance Attr FeDisplacementMap_ GlyphOrientationVertical  String  where
  attr GlyphOrientationVertical value = unsafeAttribute (  
    { key: "glyph-orientation-vertical", value: prop' value  } <$ _)
instance Attr FeDisplacementMap_ GlyphOrientationVertical (Event.Event  String ) where
  attr GlyphOrientationVertical eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-vertical", value: prop' value }


instance Attr FeFlood_ GlyphOrientationVertical  String  where
  attr GlyphOrientationVertical value = unsafeAttribute (  
    { key: "glyph-orientation-vertical", value: prop' value  } <$ _)
instance Attr FeFlood_ GlyphOrientationVertical (Event.Event  String ) where
  attr GlyphOrientationVertical eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-vertical", value: prop' value }


instance Attr FeGaussianBlur_ GlyphOrientationVertical  String  where
  attr GlyphOrientationVertical value = unsafeAttribute (  
    { key: "glyph-orientation-vertical", value: prop' value  } <$ _)
instance Attr FeGaussianBlur_ GlyphOrientationVertical (Event.Event  String ) where
  attr GlyphOrientationVertical eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-vertical", value: prop' value }


instance Attr FeImage_ GlyphOrientationVertical  String  where
  attr GlyphOrientationVertical value = unsafeAttribute (  
    { key: "glyph-orientation-vertical", value: prop' value  } <$ _)
instance Attr FeImage_ GlyphOrientationVertical (Event.Event  String ) where
  attr GlyphOrientationVertical eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-vertical", value: prop' value }


instance Attr FeMerge_ GlyphOrientationVertical  String  where
  attr GlyphOrientationVertical value = unsafeAttribute (  
    { key: "glyph-orientation-vertical", value: prop' value  } <$ _)
instance Attr FeMerge_ GlyphOrientationVertical (Event.Event  String ) where
  attr GlyphOrientationVertical eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-vertical", value: prop' value }


instance Attr FeMorphology_ GlyphOrientationVertical  String  where
  attr GlyphOrientationVertical value = unsafeAttribute (  
    { key: "glyph-orientation-vertical", value: prop' value  } <$ _)
instance Attr FeMorphology_ GlyphOrientationVertical (Event.Event  String ) where
  attr GlyphOrientationVertical eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-vertical", value: prop' value }


instance Attr FeOffset_ GlyphOrientationVertical  String  where
  attr GlyphOrientationVertical value = unsafeAttribute (  
    { key: "glyph-orientation-vertical", value: prop' value  } <$ _)
instance Attr FeOffset_ GlyphOrientationVertical (Event.Event  String ) where
  attr GlyphOrientationVertical eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-vertical", value: prop' value }


instance Attr FeSpecularLighting_ GlyphOrientationVertical  String  where
  attr GlyphOrientationVertical value = unsafeAttribute (  
    { key: "glyph-orientation-vertical", value: prop' value  } <$ _)
instance Attr FeSpecularLighting_ GlyphOrientationVertical (Event.Event  String ) where
  attr GlyphOrientationVertical eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-vertical", value: prop' value }


instance Attr FeTile_ GlyphOrientationVertical  String  where
  attr GlyphOrientationVertical value = unsafeAttribute (  
    { key: "glyph-orientation-vertical", value: prop' value  } <$ _)
instance Attr FeTile_ GlyphOrientationVertical (Event.Event  String ) where
  attr GlyphOrientationVertical eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-vertical", value: prop' value }


instance Attr FeTurbulence_ GlyphOrientationVertical  String  where
  attr GlyphOrientationVertical value = unsafeAttribute (  
    { key: "glyph-orientation-vertical", value: prop' value  } <$ _)
instance Attr FeTurbulence_ GlyphOrientationVertical (Event.Event  String ) where
  attr GlyphOrientationVertical eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-vertical", value: prop' value }


instance Attr Filter_ GlyphOrientationVertical  String  where
  attr GlyphOrientationVertical value = unsafeAttribute (  
    { key: "glyph-orientation-vertical", value: prop' value  } <$ _)
instance Attr Filter_ GlyphOrientationVertical (Event.Event  String ) where
  attr GlyphOrientationVertical eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-vertical", value: prop' value }


instance Attr Image_ GlyphOrientationVertical  String  where
  attr GlyphOrientationVertical value = unsafeAttribute (  
    { key: "glyph-orientation-vertical", value: prop' value  } <$ _)
instance Attr Image_ GlyphOrientationVertical (Event.Event  String ) where
  attr GlyphOrientationVertical eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-vertical", value: prop' value }


instance Attr Switch_ GlyphOrientationVertical  String  where
  attr GlyphOrientationVertical value = unsafeAttribute (  
    { key: "glyph-orientation-vertical", value: prop' value  } <$ _)
instance Attr Switch_ GlyphOrientationVertical (Event.Event  String ) where
  attr GlyphOrientationVertical eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "glyph-orientation-vertical", value: prop' value }


instance Attr everything GlyphOrientationVertical  Unit  where
  attr GlyphOrientationVertical _ = unsafeAttribute (  
    { key: "glyph-orientation-vertical", value: unset'  } <$ _)
instance Attr everything GlyphOrientationVertical (Event.Event  Unit ) where
  attr GlyphOrientationVertical eventValue = unsafeAttribute \_ ->
    eventValue <#> \_ -> { key: "glyph-orientation-vertical", value: unset' }
