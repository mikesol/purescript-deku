module Deku.DOM.Attr.Fr where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Fr = Fr

instance Attr RadialGradient_ Fr (NonEmpty.NonEmpty Event.Event  String ) where
  attr Fr bothValues = unsafeAttribute $ Both (pure 
    { key: "fr", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fr", value: prop' value })
instance Attr RadialGradient_ Fr (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Fr (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fr", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fr", value: prop' value })
instance Attr RadialGradient_ Fr  String  where
  attr Fr value = unsafeAttribute $ This $ pure $ { key: "fr", value: prop' value }
instance Attr RadialGradient_ Fr (Event.Event  String ) where
  attr Fr eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "fr", value: prop' value }

instance Attr RadialGradient_ Fr (ST.ST Global.Global  String ) where
  attr Fr stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "fr", value: prop' value }

instance Attr everything Fr (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Fr bothValues = unsafeAttribute $ Both (pure  { key: "fr", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "fr", value: unset' })
instance Attr everything Fr (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Fr (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "fr", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "fr", value: unset' })
instance Attr everything Fr  Unit  where
  attr Fr _ = unsafeAttribute $ This $ pure $ { key: "fr", value: unset' }
instance Attr everything Fr (Event.Event  Unit ) where
  attr Fr eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "fr", value: unset' }

instance Attr everything Fr (ST.ST Global.Global  Unit ) where
  attr Fr stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "fr", value: unset' }
