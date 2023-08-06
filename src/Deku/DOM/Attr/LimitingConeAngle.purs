module Deku.DOM.Attr.LimitingConeAngle where

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

data LimitingConeAngle = LimitingConeAngle

instance Attr FeSpotLight_ LimitingConeAngle (NonEmpty.NonEmpty Event.Event  String ) where
  attr LimitingConeAngle bothValues = unsafeAttribute $ Both (pure 
    { key: "limitingConeAngle", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "limitingConeAngle", value: prop' value }
    )
instance Attr FeSpotLight_ LimitingConeAngle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LimitingConeAngle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "limitingConeAngle", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "limitingConeAngle", value: prop' value }
    )
instance Attr FeSpotLight_ LimitingConeAngle  String  where
  attr LimitingConeAngle value = unsafeAttribute $ This $ pure $
    { key: "limitingConeAngle", value: prop' value }
instance Attr FeSpotLight_ LimitingConeAngle (Event.Event  String ) where
  attr LimitingConeAngle eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "limitingConeAngle", value: prop' value }

instance Attr FeSpotLight_ LimitingConeAngle (ST.ST Global.Global  String ) where
  attr LimitingConeAngle iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "limitingConeAngle", value: prop' value }

instance Attr everything LimitingConeAngle (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr LimitingConeAngle bothValues = unsafeAttribute $ Both (pure 
    { key: "limitingConeAngle", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "limitingConeAngle", value: unset' })
instance Attr everything LimitingConeAngle (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr LimitingConeAngle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "limitingConeAngle", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "limitingConeAngle", value: unset' })
instance Attr everything LimitingConeAngle  Unit  where
  attr LimitingConeAngle _ = unsafeAttribute $ This $ pure $
    { key: "limitingConeAngle", value: unset' }
instance Attr everything LimitingConeAngle (Event.Event  Unit ) where
  attr LimitingConeAngle eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "limitingConeAngle", value: unset' }

instance Attr everything LimitingConeAngle (ST.ST Global.Global  Unit ) where
  attr LimitingConeAngle iValue = unsafeAttribute $ This $ iValue
    <#> \_ -> { key: "limitingConeAngle", value: unset' }
