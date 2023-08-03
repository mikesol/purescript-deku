module Deku.DOM.Attr.SurfaceScale where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data SurfaceScale = SurfaceScale

instance Attr FeDiffuseLighting_ SurfaceScale (NonEmpty.NonEmpty Event.Event  String ) where
  attr SurfaceScale bothValues = unsafeAttribute $ Both
    { key: "surfaceScale", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "surfaceScale", value: prop' value })
instance Attr FeDiffuseLighting_ SurfaceScale  String  where
  attr SurfaceScale value = unsafeAttribute $ This $ pure $
    { key: "surfaceScale", value: prop' value }
instance Attr FeDiffuseLighting_ SurfaceScale (Event.Event  String ) where
  attr SurfaceScale eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "surfaceScale", value: prop' value }

instance Attr FeSpecularLighting_ SurfaceScale (NonEmpty.NonEmpty Event.Event  String ) where
  attr SurfaceScale bothValues = unsafeAttribute $ Both
    { key: "surfaceScale", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "surfaceScale", value: prop' value })
instance Attr FeSpecularLighting_ SurfaceScale  String  where
  attr SurfaceScale value = unsafeAttribute $ This $ pure $
    { key: "surfaceScale", value: prop' value }
instance Attr FeSpecularLighting_ SurfaceScale (Event.Event  String ) where
  attr SurfaceScale eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "surfaceScale", value: prop' value }

instance Attr everything SurfaceScale (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr SurfaceScale bothValues = unsafeAttribute $ Both
    { key: "surfaceScale", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "surfaceScale", value: unset' })
instance Attr everything SurfaceScale  Unit  where
  attr SurfaceScale _ = unsafeAttribute $ This $ pure $
    { key: "surfaceScale", value: unset' }
instance Attr everything SurfaceScale (Event.Event  Unit ) where
  attr SurfaceScale eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "surfaceScale", value: unset' }
