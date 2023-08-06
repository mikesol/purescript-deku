module Deku.DOM.Attr.Data where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Object (Object_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Data = Data

instance Attr Object_ Data (NonEmpty.NonEmpty Event.Event  String ) where
  attr Data bothValues = unsafeAttribute $ Both (pure 
    { key: "data", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "data", value: prop' value })
instance Attr Object_ Data (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Data (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "data", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "data", value: prop' value })
instance Attr Object_ Data  String  where
  attr Data value = unsafeAttribute $ This $ pure $
    { key: "data", value: prop' value }
instance Attr Object_ Data (Event.Event  String ) where
  attr Data eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "data", value: prop' value }

instance Attr Object_ Data (ST.ST Global.Global  String ) where
  attr Data iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "data", value: prop' value }

instance Attr everything Data (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Data bothValues = unsafeAttribute $ Both (pure  { key: "data", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "data", value: unset' })
instance Attr everything Data (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Data (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "data", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "data", value: unset' })
instance Attr everything Data  Unit  where
  attr Data _ = unsafeAttribute $ This $ { key: "data", value: unset' }
instance Attr everything Data (Event.Event  Unit ) where
  attr Data eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "data", value: unset' }

instance Attr everything Data (ST.ST Global.Global  Unit ) where
  attr Data iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "data", value: unset' }
