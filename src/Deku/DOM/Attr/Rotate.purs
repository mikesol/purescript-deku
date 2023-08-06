module Deku.DOM.Attr.Rotate where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Rotate = Rotate

instance Attr AnimateMotion_ Rotate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Rotate bothValues = unsafeAttribute $ Both (pure 
    { key: "rotate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "rotate", value: prop' value })
instance Attr AnimateMotion_ Rotate (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Rotate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "rotate", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "rotate", value: prop' value })
instance Attr AnimateMotion_ Rotate  String  where
  attr Rotate value = unsafeAttribute $ This $ pure $
    { key: "rotate", value: prop' value }
instance Attr AnimateMotion_ Rotate (Event.Event  String ) where
  attr Rotate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "rotate", value: prop' value }

instance Attr AnimateMotion_ Rotate (ST.ST Global.Global  String ) where
  attr Rotate iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "rotate", value: prop' value }

instance Attr Text_ Rotate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Rotate bothValues = unsafeAttribute $ Both (pure 
    { key: "rotate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "rotate", value: prop' value })
instance Attr Text_ Rotate (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Rotate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "rotate", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "rotate", value: prop' value })
instance Attr Text_ Rotate  String  where
  attr Rotate value = unsafeAttribute $ This $ pure $
    { key: "rotate", value: prop' value }
instance Attr Text_ Rotate (Event.Event  String ) where
  attr Rotate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "rotate", value: prop' value }

instance Attr Text_ Rotate (ST.ST Global.Global  String ) where
  attr Rotate iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "rotate", value: prop' value }

instance Attr Tspan_ Rotate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Rotate bothValues = unsafeAttribute $ Both (pure 
    { key: "rotate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "rotate", value: prop' value })
instance Attr Tspan_ Rotate (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Rotate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "rotate", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "rotate", value: prop' value })
instance Attr Tspan_ Rotate  String  where
  attr Rotate value = unsafeAttribute $ This $ pure $
    { key: "rotate", value: prop' value }
instance Attr Tspan_ Rotate (Event.Event  String ) where
  attr Rotate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "rotate", value: prop' value }

instance Attr Tspan_ Rotate (ST.ST Global.Global  String ) where
  attr Rotate iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "rotate", value: prop' value }

instance Attr everything Rotate (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Rotate bothValues = unsafeAttribute $ Both (pure 
    { key: "rotate", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "rotate", value: unset' })
instance Attr everything Rotate (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Rotate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "rotate", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "rotate", value: unset' })
instance Attr everything Rotate  Unit  where
  attr Rotate _ = unsafeAttribute $ This $ { key: "rotate", value: unset' }
instance Attr everything Rotate (Event.Event  Unit ) where
  attr Rotate eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "rotate", value: unset' }

instance Attr everything Rotate (ST.ST Global.Global  Unit ) where
  attr Rotate iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "rotate", value: unset' }
