module Deku.DOM.Attr.Checked where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Checked = Checked

instance Attr Input_ Checked (NonEmpty.NonEmpty Event.Event  String ) where
  attr Checked bothValues = unsafeAttribute $ Both (pure 
    { key: "checked", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "checked", value: prop' value })
instance Attr Input_ Checked (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Checked (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "checked", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "checked", value: prop' value })
instance Attr Input_ Checked  String  where
  attr Checked value = unsafeAttribute $ This $ pure $
    { key: "checked", value: prop' value }
instance Attr Input_ Checked (Event.Event  String ) where
  attr Checked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "checked", value: prop' value }

instance Attr Input_ Checked (ST.ST Global.Global  String ) where
  attr Checked stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "checked", value: prop' value }

instance Attr everything Checked (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Checked bothValues = unsafeAttribute $ Both (pure 
    { key: "checked", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "checked", value: unset' })
instance Attr everything Checked (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Checked (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "checked", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "checked", value: unset' })
instance Attr everything Checked  Unit  where
  attr Checked _ = unsafeAttribute $ This $ pure $ { key: "checked", value: unset' }
instance Attr everything Checked (Event.Event  Unit ) where
  attr Checked eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "checked", value: unset' }

instance Attr everything Checked (ST.ST Global.Global  Unit ) where
  attr Checked stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "checked", value: unset' }
