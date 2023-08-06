module Deku.DOM.Attr.Enctype where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Enctype = Enctype

instance Attr Form_ Enctype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Enctype bothValues = unsafeAttribute $ Both (pure 
    { key: "enctype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "enctype", value: prop' value })
instance Attr Form_ Enctype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Enctype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "enctype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "enctype", value: prop' value })
instance Attr Form_ Enctype  String  where
  attr Enctype value = unsafeAttribute $ This $ pure $
    { key: "enctype", value: prop' value }
instance Attr Form_ Enctype (Event.Event  String ) where
  attr Enctype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "enctype", value: prop' value }

instance Attr Form_ Enctype (ST.ST Global.Global  String ) where
  attr Enctype iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "enctype", value: prop' value }

instance Attr everything Enctype (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Enctype bothValues = unsafeAttribute $ Both (pure 
    { key: "enctype", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "enctype", value: unset' })
instance Attr everything Enctype (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Enctype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "enctype", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "enctype", value: unset' })
instance Attr everything Enctype  Unit  where
  attr Enctype _ = unsafeAttribute $ This $ { key: "enctype", value: unset' }
instance Attr everything Enctype (Event.Event  Unit ) where
  attr Enctype eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "enctype", value: unset' }

instance Attr everything Enctype (ST.ST Global.Global  Unit ) where
  attr Enctype iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "enctype", value: unset' }
