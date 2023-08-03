module Deku.DOM.Attr.K3 where

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

data K3 = K3

instance Attr FeComposite_ K3 (NonEmpty.NonEmpty Event.Event  String ) where
  attr K3 bothValues = unsafeAttribute $ Both (pure 
    { key: "k3", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "k3", value: prop' value })
instance Attr FeComposite_ K3 (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr K3 (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "k3", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "k3", value: prop' value })
instance Attr FeComposite_ K3  String  where
  attr K3 value = unsafeAttribute $ This $ pure $ { key: "k3", value: prop' value }
instance Attr FeComposite_ K3 (Event.Event  String ) where
  attr K3 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "k3", value: prop' value }

instance Attr FeComposite_ K3 (ST.ST Global.Global  String ) where
  attr K3 stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "k3", value: prop' value }

instance Attr everything K3 (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr K3 bothValues = unsafeAttribute $ Both (pure  { key: "k3", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "k3", value: unset' })
instance Attr everything K3 (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr K3 (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "k3", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "k3", value: unset' })
instance Attr everything K3  Unit  where
  attr K3 _ = unsafeAttribute $ This $ pure $ { key: "k3", value: unset' }
instance Attr everything K3 (Event.Event  Unit ) where
  attr K3 eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "k3", value: unset' }

instance Attr everything K3 (ST.ST Global.Global  Unit ) where
  attr K3 stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "k3", value: unset' }
