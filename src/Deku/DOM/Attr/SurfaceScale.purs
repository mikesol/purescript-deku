module Deku.DOM.Attr.SurfaceScale where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data SurfaceScale = SurfaceScale

instance Attr FeDiffuseLighting_ SurfaceScale (NonEmpty.NonEmpty Event.Event  String ) where
  attr SurfaceScale bothValues = unsafeAttribute $ Both (pure 
    { key: "surfaceScale", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "surfaceScale", value: prop' value })
instance Attr FeDiffuseLighting_ SurfaceScale (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SurfaceScale (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "surfaceScale", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "surfaceScale", value: prop' value })
instance Attr FeDiffuseLighting_ SurfaceScale  String  where
  attr SurfaceScale value = unsafeAttribute $ This $ pure $
    { key: "surfaceScale", value: prop' value }
instance Attr FeDiffuseLighting_ SurfaceScale (Event.Event  String ) where
  attr SurfaceScale eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "surfaceScale", value: prop' value }

instance Attr FeDiffuseLighting_ SurfaceScale (ST.ST Global.Global  String ) where
  attr SurfaceScale iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "surfaceScale", value: prop' value }

instance Attr FeSpecularLighting_ SurfaceScale (NonEmpty.NonEmpty Event.Event  String ) where
  attr SurfaceScale bothValues = unsafeAttribute $ Both (pure 
    { key: "surfaceScale", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "surfaceScale", value: prop' value })
instance Attr FeSpecularLighting_ SurfaceScale (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SurfaceScale (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "surfaceScale", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "surfaceScale", value: prop' value })
instance Attr FeSpecularLighting_ SurfaceScale  String  where
  attr SurfaceScale value = unsafeAttribute $ This $ pure $
    { key: "surfaceScale", value: prop' value }
instance Attr FeSpecularLighting_ SurfaceScale (Event.Event  String ) where
  attr SurfaceScale eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "surfaceScale", value: prop' value }

instance Attr FeSpecularLighting_ SurfaceScale (ST.ST Global.Global  String ) where
  attr SurfaceScale iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "surfaceScale", value: prop' value }

instance Attr everything SurfaceScale (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr SurfaceScale bothValues = unsafeAttribute $ Both (pure 
    { key: "surfaceScale", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "surfaceScale", value: unset' })
instance Attr everything SurfaceScale (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr SurfaceScale (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "surfaceScale", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "surfaceScale", value: unset' })
instance Attr everything SurfaceScale  Unit  where
  attr SurfaceScale _ = unsafeAttribute $ This $ pure $
    { key: "surfaceScale", value: unset' }
instance Attr everything SurfaceScale (Event.Event  Unit ) where
  attr SurfaceScale eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "surfaceScale", value: unset' }

instance Attr everything SurfaceScale (ST.ST Global.Global  Unit ) where
  attr SurfaceScale iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "surfaceScale", value: unset' }
