module Deku.DOM.Attr.D where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Path (Path_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data D = D

instance Attr Path_ D (NonEmpty.NonEmpty Event.Event  String ) where
  attr D bothValues = unsafeAttribute $ Both (pure 
    { key: "d", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "d", value: prop' value })
instance Attr Path_ D (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr D (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "d", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "d", value: prop' value })
instance Attr Path_ D  String  where
  attr D value = unsafeAttribute $ This $ pure $ { key: "d", value: prop' value }
instance Attr Path_ D (Event.Event  String ) where
  attr D eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "d", value: prop' value }

instance Attr Path_ D (ST.ST Global.Global  String ) where
  attr D stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "d", value: prop' value }

instance Attr everything D (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr D bothValues = unsafeAttribute $ Both (pure  { key: "d", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "d", value: unset' })
instance Attr everything D (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr D (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "d", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "d", value: unset' })
instance Attr everything D  Unit  where
  attr D _ = unsafeAttribute $ This $ pure $ { key: "d", value: unset' }
instance Attr everything D (Event.Event  Unit ) where
  attr D eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "d", value: unset' }

instance Attr everything D (ST.ST Global.Global  Unit ) where
  attr D stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "d", value: unset' }
