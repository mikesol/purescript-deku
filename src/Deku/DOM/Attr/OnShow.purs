module Deku.DOM.Attr.OnShow where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnShow = OnShow

instance Attr anything OnShow (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnShow bothValues = unsafeAttribute $ Both (pure 
    { key: "show", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "show", value: cb' value })
instance Attr anything OnShow (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnShow (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "show", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "show", value: cb' value })
instance Attr anything OnShow  Cb  where
  attr OnShow value = unsafeAttribute $ This $ pure $
    { key: "show", value: cb' value }
instance Attr anything OnShow (Event.Event  Cb ) where
  attr OnShow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "show", value: cb' value }

instance Attr anything OnShow (ST.ST Global.Global  Cb ) where
  attr OnShow stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "show", value: cb' value }

instance Attr anything OnShow (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnShow bothValues = unsafeAttribute $ Both (pure 
    { key: "show", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "show", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnShow (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnShow (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "show", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "show", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnShow  (Effect Unit)  where
  attr OnShow value = unsafeAttribute $ This $ pure $
    { key: "show", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnShow (Event.Event  (Effect Unit) ) where
  attr OnShow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "show", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnShow (ST.ST Global.Global  (Effect Unit) ) where
  attr OnShow stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "show", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnShow (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnShow bothValues = unsafeAttribute $ Both (pure 
    { key: "show", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "show", value: cb' (Cb (const value)) }
    )
instance Attr anything OnShow (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnShow (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "show", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "show", value: cb' (Cb (const value)) }
    )
instance Attr anything OnShow  (Effect Boolean)  where
  attr OnShow value = unsafeAttribute $ This $ pure $
    { key: "show", value: cb' (Cb (const value)) }
instance Attr anything OnShow (Event.Event  (Effect Boolean) ) where
  attr OnShow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "show", value: cb' (Cb (const value)) }

instance Attr anything OnShow (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnShow stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "show", value: cb' (Cb (const value)) }

instance Attr everything OnShow (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnShow bothValues = unsafeAttribute $ Both (pure  { key: "show", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "show", value: unset' })
instance Attr everything OnShow (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnShow (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "show", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "show", value: unset' })
instance Attr everything OnShow  Unit  where
  attr OnShow _ = unsafeAttribute $ This $ pure $ { key: "show", value: unset' }
instance Attr everything OnShow (Event.Event  Unit ) where
  attr OnShow eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "show", value: unset' }

instance Attr everything OnShow (ST.ST Global.Global  Unit ) where
  attr OnShow stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "show", value: unset' }
