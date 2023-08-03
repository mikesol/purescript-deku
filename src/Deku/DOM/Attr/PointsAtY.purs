module Deku.DOM.Attr.PointsAtY where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PointsAtY = PointsAtY

instance Attr FeSpotLight_ PointsAtY (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointsAtY bothValues = unsafeAttribute $ Both (pure 
    { key: "pointsAtY", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointsAtY", value: prop' value })
instance Attr FeSpotLight_ PointsAtY (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointsAtY (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointsAtY", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointsAtY", value: prop' value })
instance Attr FeSpotLight_ PointsAtY  String  where
  attr PointsAtY value = unsafeAttribute $ This $ pure $
    { key: "pointsAtY", value: prop' value }
instance Attr FeSpotLight_ PointsAtY (Event.Event  String ) where
  attr PointsAtY eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointsAtY", value: prop' value }

instance Attr FeSpotLight_ PointsAtY (ST.ST Global.Global  String ) where
  attr PointsAtY stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointsAtY", value: prop' value }

instance Attr everything PointsAtY (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr PointsAtY bothValues = unsafeAttribute $ Both (pure 
    { key: "pointsAtY", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointsAtY", value: unset' })
instance Attr everything PointsAtY (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr PointsAtY (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "pointsAtY", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "pointsAtY", value: unset' })
instance Attr everything PointsAtY  Unit  where
  attr PointsAtY _ = unsafeAttribute $ This $ pure $
    { key: "pointsAtY", value: unset' }
instance Attr everything PointsAtY (Event.Event  Unit ) where
  attr PointsAtY eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointsAtY", value: unset' }

instance Attr everything PointsAtY (ST.ST Global.Global  Unit ) where
  attr PointsAtY stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "pointsAtY", value: unset' }
