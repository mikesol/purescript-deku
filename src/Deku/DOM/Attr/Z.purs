module Deku.DOM.Attr.Z where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.DOM.Elt.FePointLight (FePointLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Z = Z

instance Attr FePointLight_ Z (NonEmpty.NonEmpty Event.Event  String ) where
  attr Z bothValues = unsafeAttribute $ Both (pure 
    { key: "z", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "z", value: prop' value })
instance Attr FePointLight_ Z (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Z (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "z", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "z", value: prop' value })
instance Attr FePointLight_ Z  String  where
  attr Z value = unsafeAttribute $ This $ { key: "z", value: prop' value }
instance Attr FePointLight_ Z (Event.Event  String ) where
  attr Z eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "z", value: prop' value }

instance Attr FePointLight_ Z (ST.ST Global.Global  String ) where
  attr Z iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "z", value: prop' value }

instance Attr FeSpotLight_ Z (NonEmpty.NonEmpty Event.Event  String ) where
  attr Z bothValues = unsafeAttribute $ Both (pure 
    { key: "z", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "z", value: prop' value })
instance Attr FeSpotLight_ Z (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Z (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "z", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "z", value: prop' value })
instance Attr FeSpotLight_ Z  String  where
  attr Z value = unsafeAttribute $ This $ { key: "z", value: prop' value }
instance Attr FeSpotLight_ Z (Event.Event  String ) where
  attr Z eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "z", value: prop' value }

instance Attr FeSpotLight_ Z (ST.ST Global.Global  String ) where
  attr Z iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "z", value: prop' value }

instance Attr everything Z (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Z bothValues = unsafeAttribute $ Both (pure  { key: "z", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "z", value: unset' })
instance Attr everything Z (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Z (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "z", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "z", value: unset' })
instance Attr everything Z  Unit  where
  attr Z _ = unsafeAttribute $ This $ { key: "z", value: unset' }
instance Attr everything Z (Event.Event  Unit ) where
  attr Z eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "z", value: unset' }

instance Attr everything Z (ST.ST Global.Global  Unit ) where
  attr Z iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "z", value: unset' }
