module Deku.DOM.Attr.Minlength where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Minlength = Minlength

instance Attr Input_ Minlength (NonEmpty.NonEmpty Event.Event  String ) where
  attr Minlength bothValues = unsafeAttribute $ Both (pure 
    { key: "minlength", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "minlength", value: prop' value })
instance Attr Input_ Minlength (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Minlength (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "minlength", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "minlength", value: prop' value })
instance Attr Input_ Minlength  String  where
  attr Minlength value = unsafeAttribute $ This $ pure $
    { key: "minlength", value: prop' value }
instance Attr Input_ Minlength (Event.Event  String ) where
  attr Minlength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "minlength", value: prop' value }

instance Attr Input_ Minlength (ST.ST Global.Global  String ) where
  attr Minlength stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "minlength", value: prop' value }

instance Attr Textarea_ Minlength (NonEmpty.NonEmpty Event.Event  String ) where
  attr Minlength bothValues = unsafeAttribute $ Both (pure 
    { key: "minlength", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "minlength", value: prop' value })
instance Attr Textarea_ Minlength (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Minlength (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "minlength", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "minlength", value: prop' value })
instance Attr Textarea_ Minlength  String  where
  attr Minlength value = unsafeAttribute $ This $ pure $
    { key: "minlength", value: prop' value }
instance Attr Textarea_ Minlength (Event.Event  String ) where
  attr Minlength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "minlength", value: prop' value }

instance Attr Textarea_ Minlength (ST.ST Global.Global  String ) where
  attr Minlength stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "minlength", value: prop' value }

instance Attr everything Minlength (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Minlength bothValues = unsafeAttribute $ Both (pure 
    { key: "minlength", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "minlength", value: unset' })
instance Attr everything Minlength (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Minlength (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "minlength", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "minlength", value: unset' })
instance Attr everything Minlength  Unit  where
  attr Minlength _ = unsafeAttribute $ This $ pure $
    { key: "minlength", value: unset' }
instance Attr everything Minlength (Event.Event  Unit ) where
  attr Minlength eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "minlength", value: unset' }

instance Attr everything Minlength (ST.ST Global.Global  Unit ) where
  attr Minlength stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "minlength", value: unset' }
