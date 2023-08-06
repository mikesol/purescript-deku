module Deku.DOM.Attr.Intrinsicsize where

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

data Intrinsicsize = Intrinsicsize

instance Attr Img_ Intrinsicsize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Intrinsicsize bothValues = unsafeAttribute $ Both (pure 
    { key: "intrinsicsize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "intrinsicsize", value: prop' value })
instance Attr Img_ Intrinsicsize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Intrinsicsize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "intrinsicsize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "intrinsicsize", value: prop' value })
instance Attr Img_ Intrinsicsize  String  where
  attr Intrinsicsize value = unsafeAttribute $ This $ pure $
    { key: "intrinsicsize", value: prop' value }
instance Attr Img_ Intrinsicsize (Event.Event  String ) where
  attr Intrinsicsize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "intrinsicsize", value: prop' value }

instance Attr Img_ Intrinsicsize (ST.ST Global.Global  String ) where
  attr Intrinsicsize iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "intrinsicsize", value: prop' value }

instance Attr everything Intrinsicsize (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Intrinsicsize bothValues = unsafeAttribute $ Both (pure 
    { key: "intrinsicsize", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "intrinsicsize", value: unset' })
instance Attr everything Intrinsicsize (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Intrinsicsize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "intrinsicsize", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "intrinsicsize", value: unset' })
instance Attr everything Intrinsicsize  Unit  where
  attr Intrinsicsize _ = unsafeAttribute $ This $ pure $
    { key: "intrinsicsize", value: unset' }
instance Attr everything Intrinsicsize (Event.Event  Unit ) where
  attr Intrinsicsize eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "intrinsicsize", value: unset' }

instance Attr everything Intrinsicsize (ST.ST Global.Global  Unit ) where
  attr Intrinsicsize iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "intrinsicsize", value: unset' }
