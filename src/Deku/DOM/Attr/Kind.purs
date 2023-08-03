module Deku.DOM.Attr.Kind where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Kind = Kind

instance Attr Track_ Kind (NonEmpty.NonEmpty Event.Event  String ) where
  attr Kind bothValues = unsafeAttribute $ Both (pure 
    { key: "kind", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "kind", value: prop' value })
instance Attr Track_ Kind (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Kind (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "kind", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "kind", value: prop' value })
instance Attr Track_ Kind  String  where
  attr Kind value = unsafeAttribute $ This $ pure $
    { key: "kind", value: prop' value }
instance Attr Track_ Kind (Event.Event  String ) where
  attr Kind eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "kind", value: prop' value }

instance Attr Track_ Kind (ST.ST Global.Global  String ) where
  attr Kind stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "kind", value: prop' value }

instance Attr everything Kind (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Kind bothValues = unsafeAttribute $ Both (pure  { key: "kind", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "kind", value: unset' })
instance Attr everything Kind (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Kind (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "kind", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "kind", value: unset' })
instance Attr everything Kind  Unit  where
  attr Kind _ = unsafeAttribute $ This $ pure $ { key: "kind", value: unset' }
instance Attr everything Kind (Event.Event  Unit ) where
  attr Kind eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "kind", value: unset' }

instance Attr everything Kind (ST.ST Global.Global  Unit ) where
  attr Kind stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "kind", value: unset' }
