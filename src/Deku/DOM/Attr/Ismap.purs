module Deku.DOM.Attr.Ismap where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Img (Img_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Ismap = Ismap

instance Attr Img_ Ismap (NonEmpty.NonEmpty Event.Event  String ) where
  attr Ismap bothValues = unsafeAttribute $ Both (pure 
    { key: "ismap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "ismap", value: prop' value })
instance Attr Img_ Ismap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Ismap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "ismap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "ismap", value: prop' value })
instance Attr Img_ Ismap  String  where
  attr Ismap value = unsafeAttribute $ This $ pure $
    { key: "ismap", value: prop' value }
instance Attr Img_ Ismap (Event.Event  String ) where
  attr Ismap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "ismap", value: prop' value }

instance Attr Img_ Ismap (ST.ST Global.Global  String ) where
  attr Ismap stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "ismap", value: prop' value }

instance Attr everything Ismap (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Ismap bothValues = unsafeAttribute $ Both (pure  { key: "ismap", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "ismap", value: unset' })
instance Attr everything Ismap (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Ismap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "ismap", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "ismap", value: unset' })
instance Attr everything Ismap  Unit  where
  attr Ismap _ = unsafeAttribute $ This $ pure $ { key: "ismap", value: unset' }
instance Attr everything Ismap (Event.Event  Unit ) where
  attr Ismap eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "ismap", value: unset' }

instance Attr everything Ismap (ST.ST Global.Global  Unit ) where
  attr Ismap stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "ismap", value: unset' }
