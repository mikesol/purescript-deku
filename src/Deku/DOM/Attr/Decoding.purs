module Deku.DOM.Attr.Decoding where

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

data Decoding = Decoding

instance Attr Img_ Decoding (NonEmpty.NonEmpty Event.Event  String ) where
  attr Decoding bothValues = unsafeAttribute $ Both (pure 
    { key: "decoding", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "decoding", value: prop' value })
instance Attr Img_ Decoding (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Decoding (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "decoding", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "decoding", value: prop' value })
instance Attr Img_ Decoding  String  where
  attr Decoding value = unsafeAttribute $ This $ pure $
    { key: "decoding", value: prop' value }
instance Attr Img_ Decoding (Event.Event  String ) where
  attr Decoding eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "decoding", value: prop' value }

instance Attr Img_ Decoding (ST.ST Global.Global  String ) where
  attr Decoding iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "decoding", value: prop' value }

instance Attr everything Decoding (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Decoding bothValues = unsafeAttribute $ Both (pure 
    { key: "decoding", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "decoding", value: unset' })
instance Attr everything Decoding (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Decoding (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "decoding", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "decoding", value: unset' })
instance Attr everything Decoding  Unit  where
  attr Decoding _ = unsafeAttribute $ This $ pure $
    { key: "decoding", value: unset' }
instance Attr everything Decoding (Event.Event  Unit ) where
  attr Decoding eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "decoding", value: unset' }

instance Attr everything Decoding (ST.ST Global.Global  Unit ) where
  attr Decoding iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "decoding", value: unset' }
