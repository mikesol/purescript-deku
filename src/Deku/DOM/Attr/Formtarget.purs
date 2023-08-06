module Deku.DOM.Attr.Formtarget where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formtarget = Formtarget

instance Attr Button_ Formtarget (NonEmpty.NonEmpty Event.Event  String ) where
  attr Formtarget bothValues = unsafeAttribute $ Both (pure 
    { key: "formtarget", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "formtarget", value: prop' value })
instance Attr Button_ Formtarget (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Formtarget (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "formtarget", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "formtarget", value: prop' value })
instance Attr Button_ Formtarget  String  where
  attr Formtarget value = unsafeAttribute $ This $ pure $
    { key: "formtarget", value: prop' value }
instance Attr Button_ Formtarget (Event.Event  String ) where
  attr Formtarget eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formtarget", value: prop' value }

instance Attr Button_ Formtarget (ST.ST Global.Global  String ) where
  attr Formtarget iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "formtarget", value: prop' value }

instance Attr Input_ Formtarget (NonEmpty.NonEmpty Event.Event  String ) where
  attr Formtarget bothValues = unsafeAttribute $ Both (pure 
    { key: "formtarget", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "formtarget", value: prop' value })
instance Attr Input_ Formtarget (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Formtarget (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "formtarget", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "formtarget", value: prop' value })
instance Attr Input_ Formtarget  String  where
  attr Formtarget value = unsafeAttribute $ This $ pure $
    { key: "formtarget", value: prop' value }
instance Attr Input_ Formtarget (Event.Event  String ) where
  attr Formtarget eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formtarget", value: prop' value }

instance Attr Input_ Formtarget (ST.ST Global.Global  String ) where
  attr Formtarget iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "formtarget", value: prop' value }

instance Attr everything Formtarget (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Formtarget bothValues = unsafeAttribute $ Both (pure 
    { key: "formtarget", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "formtarget", value: unset' })
instance Attr everything Formtarget (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Formtarget (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "formtarget", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "formtarget", value: unset' })
instance Attr everything Formtarget  Unit  where
  attr Formtarget _ = unsafeAttribute $ This $ pure $
    { key: "formtarget", value: unset' }
instance Attr everything Formtarget (Event.Event  Unit ) where
  attr Formtarget eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "formtarget", value: unset' }

instance Attr everything Formtarget (ST.ST Global.Global  Unit ) where
  attr Formtarget iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "formtarget", value: unset' }
