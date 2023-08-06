module Deku.DOM.Attr.K1 where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data K1 = K1

instance Attr FeComposite_ K1 (NonEmpty.NonEmpty Event.Event  String ) where
  attr K1 bothValues = unsafeAttribute $ Both (pure 
    { key: "k1", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "k1", value: prop' value })
instance Attr FeComposite_ K1 (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr K1 (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "k1", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "k1", value: prop' value })
instance Attr FeComposite_ K1  String  where
  attr K1 value = unsafeAttribute $ This $ { key: "k1", value: prop' value }
instance Attr FeComposite_ K1 (Event.Event  String ) where
  attr K1 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "k1", value: prop' value }

instance Attr FeComposite_ K1 (ST.ST Global.Global  String ) where
  attr K1 iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "k1", value: prop' value }

instance Attr everything K1 (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr K1 bothValues = unsafeAttribute $ Both (pure  { key: "k1", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "k1", value: unset' })
instance Attr everything K1 (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr K1 (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "k1", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "k1", value: unset' })
instance Attr everything K1  Unit  where
  attr K1 _ = unsafeAttribute $ This $ { key: "k1", value: unset' }
instance Attr everything K1 (Event.Event  Unit ) where
  attr K1 eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "k1", value: unset' }

instance Attr everything K1 (ST.ST Global.Global  Unit ) where
  attr K1 iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "k1", value: unset' }
