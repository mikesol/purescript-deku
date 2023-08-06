module Deku.DOM.Attr.Multiple where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Multiple = Multiple

instance Attr Input_ Multiple (NonEmpty.NonEmpty Event.Event  String ) where
  attr Multiple bothValues = unsafeAttribute $ Both (pure 
    { key: "multiple", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "multiple", value: prop' value })
instance Attr Input_ Multiple (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Multiple (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "multiple", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "multiple", value: prop' value })
instance Attr Input_ Multiple  String  where
  attr Multiple value = unsafeAttribute $ This $ pure $
    { key: "multiple", value: prop' value }
instance Attr Input_ Multiple (Event.Event  String ) where
  attr Multiple eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "multiple", value: prop' value }

instance Attr Input_ Multiple (ST.ST Global.Global  String ) where
  attr Multiple iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "multiple", value: prop' value }

instance Attr Select_ Multiple (NonEmpty.NonEmpty Event.Event  String ) where
  attr Multiple bothValues = unsafeAttribute $ Both (pure 
    { key: "multiple", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "multiple", value: prop' value })
instance Attr Select_ Multiple (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Multiple (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "multiple", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "multiple", value: prop' value })
instance Attr Select_ Multiple  String  where
  attr Multiple value = unsafeAttribute $ This $ pure $
    { key: "multiple", value: prop' value }
instance Attr Select_ Multiple (Event.Event  String ) where
  attr Multiple eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "multiple", value: prop' value }

instance Attr Select_ Multiple (ST.ST Global.Global  String ) where
  attr Multiple iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "multiple", value: prop' value }

instance Attr everything Multiple (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Multiple bothValues = unsafeAttribute $ Both (pure 
    { key: "multiple", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "multiple", value: unset' })
instance Attr everything Multiple (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Multiple (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "multiple", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "multiple", value: unset' })
instance Attr everything Multiple  Unit  where
  attr Multiple _ = unsafeAttribute $ This $ pure $
    { key: "multiple", value: unset' }
instance Attr everything Multiple (Event.Event  Unit ) where
  attr Multiple eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "multiple", value: unset' }

instance Attr everything Multiple (ST.ST Global.Global  Unit ) where
  attr Multiple iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "multiple", value: unset' }
