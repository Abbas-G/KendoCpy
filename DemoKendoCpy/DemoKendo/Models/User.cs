using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace DemoKendo.Models
{
    public class User
    {
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Name { get; set; }

        public string UserName { get; set; }
        public Boolean IsAdmin { get; set; }
    }

    public class CategoryModel
    {
        [Required]
        public int Cateid { get; set; }

        [Required]
        public string CateName { get; set; }

        [Required]
        public string CategoryName { get; set; }
        private List<SelectListItem> _CategoryList = new List<SelectListItem>();
        public List<SelectListItem> CategoryList
        {
            get
            {
                _CategoryList.Clear();
                _CategoryList = new List<SelectListItem>();
                _CategoryList.Add(new SelectListItem() { Text = "Brochures", Value = "Brochures" });
                _CategoryList.Add(new SelectListItem() { Text = "Newsroom", Value = "Newsroom" });
                _CategoryList.Add(new SelectListItem() { Text = "Catalogues", Value = "Catalogues" });
                _CategoryList.Add(new SelectListItem() { Text = "Videos", Value = "Videos" });

                return _CategoryList;
            }
            set
            { _CategoryList = value; }
        }

        [Required]
        [DisplayName("Number")]
        public int Number { get; set; }
    }

    public class TestModel
    {

        [Range(typeof(bool), "true", "true", ErrorMessage = "You must accept the terms")]
        public bool IsRadio { get; set; }

        [Required]
        public string name { get; set; }

        [Required]
        public string Address { get; set; }

        [Required]
        public int Number { get; set; }

        [CategoryRequired(ErrorMessage = "Please Category")]
        public string Category { get; set; }

        [DataType(DataType.Date)]
        [FutureDate(ErrorMessage = "Please enter a date in the future")] //custom Validation property FutureDate is call 
        public DateTime FutureDate { get; set; }

    }
    //[Bind(Exclude = "Username")] //this bind attribute will exclude an "CouponCode" property from being posted to server
    [PropertiesMustMatch("Password", "ConfirmPassword", ErrorMessage = "The password and confirmation password do not match.")]
    public class AccountModel
    {
        [Required]
        public string Username { get; set; }

        [Required]
        [ValidatePasswordLength]
        [DataType(DataType.Password)]
        [DisplayName("Password")]
        public string Password { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [DisplayName("Confirm new password")]
        public string ConfirmPassword { get; set; }
    }
    public sealed class FutureDateAttribute : RequiredAttribute
    {
        public override bool IsValid(object value)
        {
            return base.IsValid(value) &&
            value is DateTime &&
            ((DateTime)value) > DateTime.Now;
        }
    }

    public sealed class CategoryRequiredAttribute : RequiredAttribute
    {
        public override bool IsValid(object value)
        {
            return base.IsValid(value) &&
            ((String)value) != "--Select--";
        }
    }

    [AttributeUsage(AttributeTargets.Field | AttributeTargets.Property, AllowMultiple = false, Inherited = true)]
    public sealed class ValidatePasswordLengthAttribute : ValidationAttribute
    {
        private const string _defaultErrorMessage = "'{0}' must be at least {1} characters long.";
        private readonly int _minCharacters = Membership.Provider.MinRequiredPasswordLength;

        public ValidatePasswordLengthAttribute()
            : base(_defaultErrorMessage)
        {
        }

        public override string FormatErrorMessage(string name)
        {
            return String.Format(CultureInfo.CurrentUICulture, ErrorMessageString,
                name, _minCharacters);
        }

        public override bool IsValid(object value)
        {
            string valueAsString = value as string;
            return (valueAsString != null && valueAsString.Length >= _minCharacters);
        }
    }

    [AttributeUsage(AttributeTargets.Class, AllowMultiple = true, Inherited = true)]
    public sealed class PropertiesMustMatchAttribute : ValidationAttribute
    {
        private const string _defaultErrorMessage = "'{0}' and '{1}' do not match.";
        private readonly object _typeId = new object();

        public PropertiesMustMatchAttribute(string originalProperty, string confirmProperty)
            : base(_defaultErrorMessage)
        {
            OriginalProperty = originalProperty;
            ConfirmProperty = confirmProperty;
        }

        public string ConfirmProperty { get; private set; }
        public string OriginalProperty { get; private set; }

        public override object TypeId
        {
            get
            {
                return _typeId;
            }
        }

        public override string FormatErrorMessage(string name)
        {
            return String.Format(CultureInfo.CurrentUICulture, ErrorMessageString,
                OriginalProperty, ConfirmProperty);
        }

        public override bool IsValid(object value)
        {
            PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(value);
            object originalValue = properties.Find(OriginalProperty, true /* ignoreCase */).GetValue(value);
            object confirmValue = properties.Find(ConfirmProperty, true /* ignoreCase */).GetValue(value);
            return Object.Equals(originalValue, confirmValue);
        }
    }
}
