module Deku.DOM.Attr.Formaction where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Button (Button_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formaction = Formaction

instance Attr Input_ Formaction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Formaction bothValues = unsafeAttribute $ Both (pure 
    { key: "formaction", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "formaction", value: prop' value })
instance Attr Input_ Formaction (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Formaction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "formaction", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "formaction", value: prop' value })
instance Attr Input_ Formaction  String  where
  attr Formaction value = unsafeAttribute $ This $ pure $
    { key: "formaction", value: prop' value }
instance Attr Input_ Formaction (Event.Event  String ) where
  attr Formaction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formaction", value: prop' value }

instance Attr Input_ Formaction (ST.ST Global.Global  String ) where
  attr Formaction stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "formaction", value: prop' value }

instance Attr Button_ Formaction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Formaction bothValues = unsafeAttribute $ Both (pure 
    { key: "formaction", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "formaction", value: prop' value })
instance Attr Button_ Formaction (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Formaction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "formaction", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "formaction", value: prop' value })
instance Attr Button_ Formaction  String  where
  attr Formaction value = unsafeAttribute $ This $ pure $
    { key: "formaction", value: prop' value }
instance Attr Button_ Formaction (Event.Event  String ) where
  attr Formaction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formaction", value: prop' value }

instance Attr Button_ Formaction (ST.ST Global.Global  String ) where
  attr Formaction stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "formaction", value: prop' value }

instance Attr everything Formaction (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Formaction bothValues = unsafeAttribute $ Both (pure 
    { key: "formaction", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "formaction", value: unset' })
instance Attr everything Formaction (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Formaction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "formaction", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "formaction", value: unset' })
instance Attr everything Formaction  Unit  where
  attr Formaction _ = unsafeAttribute $ This $ pure $
    { key: "formaction", value: unset' }
instance Attr everything Formaction (Event.Event  Unit ) where
  attr Formaction eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "formaction", value: unset' }

instance Attr everything Formaction (ST.ST Global.Global  Unit ) where
  attr Formaction stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "formaction", value: unset' }
