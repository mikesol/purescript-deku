module Deku.DOM.Attr.Srclang where

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

data Srclang = Srclang

instance Attr Track_ Srclang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Srclang bothValues = unsafeAttribute $ Both (pure 
    { key: "srclang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "srclang", value: prop' value })
instance Attr Track_ Srclang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Srclang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "srclang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "srclang", value: prop' value })
instance Attr Track_ Srclang  String  where
  attr Srclang value = unsafeAttribute $ This $ pure $
    { key: "srclang", value: prop' value }
instance Attr Track_ Srclang (Event.Event  String ) where
  attr Srclang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "srclang", value: prop' value }

instance Attr Track_ Srclang (ST.ST Global.Global  String ) where
  attr Srclang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "srclang", value: prop' value }

instance Attr everything Srclang (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Srclang bothValues = unsafeAttribute $ Both (pure 
    { key: "srclang", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "srclang", value: unset' })
instance Attr everything Srclang (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Srclang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "srclang", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "srclang", value: unset' })
instance Attr everything Srclang  Unit  where
  attr Srclang _ = unsafeAttribute $ This $ { key: "srclang", value: unset' }
instance Attr everything Srclang (Event.Event  Unit ) where
  attr Srclang eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "srclang", value: unset' }

instance Attr everything Srclang (ST.ST Global.Global  Unit ) where
  attr Srclang iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "srclang", value: unset' }
