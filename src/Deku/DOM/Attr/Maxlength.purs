module Deku.DOM.Attr.Maxlength where

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

data Maxlength = Maxlength

instance Attr Input_ Maxlength (NonEmpty.NonEmpty Event.Event  String ) where
  attr Maxlength bothValues = unsafeAttribute $ Both (pure 
    { key: "maxlength", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "maxlength", value: prop' value })
instance Attr Input_ Maxlength (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Maxlength (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "maxlength", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "maxlength", value: prop' value })
instance Attr Input_ Maxlength  String  where
  attr Maxlength value = unsafeAttribute $ This $ pure $
    { key: "maxlength", value: prop' value }
instance Attr Input_ Maxlength (Event.Event  String ) where
  attr Maxlength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "maxlength", value: prop' value }

instance Attr Input_ Maxlength (ST.ST Global.Global  String ) where
  attr Maxlength stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "maxlength", value: prop' value }

instance Attr Textarea_ Maxlength (NonEmpty.NonEmpty Event.Event  String ) where
  attr Maxlength bothValues = unsafeAttribute $ Both (pure 
    { key: "maxlength", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "maxlength", value: prop' value })
instance Attr Textarea_ Maxlength (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Maxlength (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "maxlength", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "maxlength", value: prop' value })
instance Attr Textarea_ Maxlength  String  where
  attr Maxlength value = unsafeAttribute $ This $ pure $
    { key: "maxlength", value: prop' value }
instance Attr Textarea_ Maxlength (Event.Event  String ) where
  attr Maxlength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "maxlength", value: prop' value }

instance Attr Textarea_ Maxlength (ST.ST Global.Global  String ) where
  attr Maxlength stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "maxlength", value: prop' value }

instance Attr everything Maxlength (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Maxlength bothValues = unsafeAttribute $ Both (pure 
    { key: "maxlength", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "maxlength", value: unset' })
instance Attr everything Maxlength (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Maxlength (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "maxlength", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "maxlength", value: unset' })
instance Attr everything Maxlength  Unit  where
  attr Maxlength _ = unsafeAttribute $ This $ pure $
    { key: "maxlength", value: unset' }
instance Attr everything Maxlength (Event.Event  Unit ) where
  attr Maxlength eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "maxlength", value: unset' }

instance Attr everything Maxlength (ST.ST Global.Global  Unit ) where
  attr Maxlength stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "maxlength", value: unset' }
