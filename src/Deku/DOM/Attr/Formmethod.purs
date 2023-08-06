module Deku.DOM.Attr.Formmethod where

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

data Formmethod = Formmethod

instance Attr Button_ Formmethod (NonEmpty.NonEmpty Event.Event  String ) where
  attr Formmethod bothValues = unsafeAttribute $ Both (pure 
    { key: "formmethod", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "formmethod", value: prop' value })
instance Attr Button_ Formmethod (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Formmethod (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "formmethod", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "formmethod", value: prop' value })
instance Attr Button_ Formmethod  String  where
  attr Formmethod value = unsafeAttribute $ This $ pure $
    { key: "formmethod", value: prop' value }
instance Attr Button_ Formmethod (Event.Event  String ) where
  attr Formmethod eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formmethod", value: prop' value }

instance Attr Button_ Formmethod (ST.ST Global.Global  String ) where
  attr Formmethod iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "formmethod", value: prop' value }

instance Attr Input_ Formmethod (NonEmpty.NonEmpty Event.Event  String ) where
  attr Formmethod bothValues = unsafeAttribute $ Both (pure 
    { key: "formmethod", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "formmethod", value: prop' value })
instance Attr Input_ Formmethod (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Formmethod (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "formmethod", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "formmethod", value: prop' value })
instance Attr Input_ Formmethod  String  where
  attr Formmethod value = unsafeAttribute $ This $ pure $
    { key: "formmethod", value: prop' value }
instance Attr Input_ Formmethod (Event.Event  String ) where
  attr Formmethod eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formmethod", value: prop' value }

instance Attr Input_ Formmethod (ST.ST Global.Global  String ) where
  attr Formmethod iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "formmethod", value: prop' value }

instance Attr everything Formmethod (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Formmethod bothValues = unsafeAttribute $ Both (pure 
    { key: "formmethod", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "formmethod", value: unset' })
instance Attr everything Formmethod (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Formmethod (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "formmethod", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "formmethod", value: unset' })
instance Attr everything Formmethod  Unit  where
  attr Formmethod _ = unsafeAttribute $ This $ pure $
    { key: "formmethod", value: unset' }
instance Attr everything Formmethod (Event.Event  Unit ) where
  attr Formmethod eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "formmethod", value: unset' }

instance Attr everything Formmethod (ST.ST Global.Global  Unit ) where
  attr Formmethod iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "formmethod", value: unset' }
